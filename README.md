Getting and Cleaning Data
===========
The repo contains the instructions to convert raw 'Human Activity Recognition Using Smartphones' data to tidy data

Full details about the data can be found at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Below is the example dataset that was converted using the script.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The files included are 
1. script 'run_analysis.R' which is necessary to convert the data from raw to tidy.
2. codebook which details the tidy dataset and how it was derived from the raw dataset


### Steps for converting the data

1. Download the raw data files into a sub-directory "UCI HAR Dataset" of where the run_analysis.R script resides.  The expected directory structure is below
     UCI HAR Dataset/
        activity_labels.txt
        features.txt
        train/
           X_traing.txt
           y_train.txt
           subject_train.txt
    	test/
    		X_test.txt
    		y_test.txt
    		subject_test.txt
2. Install dplyr package if not already installed.   Do 'install.packages("dplyr")' from R or R Studio shell
3. Run the script.   Do 'source("run_analysis.R)' from R shell.  This should generate a file "tidy_data.txt" in the current directory
4. You can view the data by running 'data <- read.table("tidy_data.txt", header = T)'
