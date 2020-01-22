# func_readsql -----------------------------------------------
# DESC: Allows the import of user-formatted SQL scripts that aren't traditionally readable by transforming it to be machine-readable.
# PACKAGE DEPENDENCIES: none
# FUNCTION DEPENDENCIES: none
# CREDIT: https://github.com/dfe-analytical-services/dfeR/blob/master/R/loading_data.R
# NOTES: none
# ARGUMENTS:
# 1. file | (string) path of .Rmd file you want to pull in

func_readsql <- function(file) {
  
  if (!is.character(file)) stop("file parmaeter must be of type character")
  
  # Read in all lines from file
  sqlLines <- readLines(file)
  
  # set any use lines to blank
  sqlLines <- gsub("^Use+.*$", "", sqlLines, perl = TRUE, ignore.case = TRUE)
  
  # set any go lines to blank
  sqlLines <- gsub("^GO+.*$", "", sqlLines, perl = TRUE, ignore.case = TRUE)
  
  # set any comments lines to blank
  sqlLines <- gsub("--.*", "", sqlLines, perl = TRUE)
  
  # remove all tabs
  sqlLines <- gsub("\t+", "", sqlLines, perl = TRUE)
  
  # remove leading whitespace
  sqlLines <- gsub("^\\s+", "", sqlLines, perl = TRUE)
  
  # remove trailing whitespace
  sqlLines <- gsub("\\s+$", "", sqlLines, perl = TRUE)
  
  # collapse multiple spaces to a single space
  sqlLines <- gsub("[ ]+", " ", sqlLines, perl = TRUE)
  
  # Filter out any blank lines
  sqlLines <- Filter(function(x) x != "", sqlLines)
  
  # Collapse into string
  sqlString <- paste(unlist(sqlLines) ,collapse = " ")
  
  # Return result
  return(sqlString)
  
}