# Training: Using BigQuery with R
Welcome to this repository of training materials for working with BigQuery in R.

## Who are these training materials for?
These training materials are designed for people who wish to query their Google [BigQuery](https://cloud.google.com/bigquery/) database using R.

In particular, it was motivated by the desire to analyse *very large* datasets in R, without breaking one's desktop/laptop/calculator! The idea is that dataframes used in R are stored on your computer's *in-memory*, meaning they are stored on your RAM as opposed to your hard-disk drive (HDD) or solid-state drive (SSD). Whilst this allows fast reading, writing and transformation of dataframes, it stops the loading datasets that require a storage space larger than your RAM.  

## Is there anything I need anlongside this repo?
You'll need to have set yuorself up on [Google Cloud Platform](https://cloud.google.com/) and have got yourself access to the free `google_analytics_sample` data.

## I don't have/like Google, do you have alternative methods?
Sure, there was a blogpost written on this on the [rpubs website](https://rpubs.com/msundar/large_data_analysis) which goes into more detail about other means you can go about this.

