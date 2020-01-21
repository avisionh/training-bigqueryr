# Training: Using BigQuery with R 👩‍💻

Welcome to this repository of training materials for working with BigQuery in R.

The training materials will be written using a mixture of the below:

- R
- SQL (the BigQuery flavour)

## Who are these training materials for? 🙋‍

These training materials are designed for people who wish to query their Google [BigQuery](https://cloud.google.com/bigquery/) database using R.

In particular, it was motivated by the desire to analyse *very large* datasets in R, without breaking one's desktop/laptop/calculator! The idea is that dataframes used in R are stored on your computer's *in-memory*, meaning they are stored on your RAM as opposed to your hard-disk drive (HDD) or solid-state drive (SSD). Whilst this allows fast reading, writing and transformation of dataframes, it stops the loading datasets that require a storage space larger than your RAM.  

## Is there anything I need alongside this repo? ☁️

You'll need to have set yourself up on [Google Cloud Platform](https://cloud.google.com/) and have got yourself access to the free `google_analytics_sample` data.

### Billing project
The following is copied off of the `bigrquery` package REAME.md [here](https://github.com/r-dbi/bigrquery).

If you just want to play around with the BigQuery API, it’s easiest to start with Google’s free sample data. You’ll still need to create a project, but if you’re just playing around, it’s unlikely that you’ll go over the free limit (1 TB of queries / 10 GB of storage).

To create a project:

Open https://console.cloud.google.com/ and create a project. Make a note of the “Project ID” in the “Project info” box.

Click on “APIs & Services”, then “Dashboard” in the left the left menu.

Click on “Enable Apis and Services” at the top of the page, then search for “BigQuery API” and “Cloud storage”.

Use your project ID as the billing project whenever you work with free sample data; and as the project when you work with your own data.

## I don't have/like Google, do you have alternative methods? 🎒

Sure, there was a blogpost written on this on the [rpubs website](https://rpubs.com/msundar/large_data_analysis) which goes into more detail about other means you can go about this.
