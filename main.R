# -------- #
## main.R ##
# -------- #

# ----------------------------------------------------------------
# Desc: This is where the main code will live.
# Credit: Please see functions.
# Script Dependencies: None
# Notes: Might break out into further scripts and an Rmarkdown file.
# ----------------------------------------------------------------

# import relevant packages
vector_packages <- c(
  "bigrquery", 
  "DBI", 
  "dbplyr",
  "dplyr",
  "tidyr",
  "purrr"
)
sapply(X = vector_packages, FUN = require, character.only = TRUE)

# authorise Gmail
bq_auth()

# low-level API
id_project <- "training-265812"
query_sql <- func_readsql(file = "queries/data_ga_samples,sql")

# Low-level API -----------------------------------------------------------

query <- bq_project_query(x = id_project, query = sql_test)
data <- bq_table_download(x = query, max_results = 15)


# Using DBI ---------------------------------------------------------------

conn_projecttraining <- dbConnect(drv = bigquery(),
                                  project = "bigquery-public-data",
                                  dataset = "google_analytics_sample",
                                  billing = id_project)
# list tables in dataset
dbListTables(conn = conn_projecttraining)

# run query in BigQuery and store results in-memory
data_test <- dbGetQuery(conn = conn_projecttraining, statement = query_sql)


# Using dplyr -------------------------------------------------------------
conn_projecttraining <- src_bigquery(project = "bigquery-public-data",
                                     dataset = "google_analytics_sample",
                                     billing = id_project)

ref <- bq_table(project = "bigquery-public-data", dataset = "google_analytics_sample", table = "ga_sessions_20170801")



# pull table descriptors from BigQuery
data_gasessions <- tbl(src = conn_projecttraining, "ga_sessions_20170801")
# pull table descriptors and treat like a table
# are querying directly from BigQuery so cost overheads are lower
data_gasessions %>% bq_table_size()
  select(visitId, visitStartTime, date, totals) %>%
  # save results into a tibble so we can unnest
  collect() %>% 
  # preserve named lists for eventual column name output via conversion to data.frame/tibble
  mutate(totals = invoke_map(.f = tibble, .x = totals)) %>% 
  # unnest columns with lists in them
  unnest(totals) %>% 
  group_by(date) %>% 
  summarise(visits = sum(x = visits, na.rm = TRUE),
            hits = sum(x = hits, na.rm = TRUE),
            pageviews = sum(x = pageviews, na.rm = TRUE))
 