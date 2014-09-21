Codebook for Human Activity Recognition Using Smartphones Tidy Dataset
===========
The raw dataset used was
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data merge process is show in the picture below (provided by TA David)
![](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png?raw=true)

The data was converted by following the below steps
1. Read the files 
```
     UCI HAR Dataset/
        activity_labels.txt
        features.txt
        train/
           X_train.txt
           y_train.txt
           subject_train.txt
    	test/
    		X_test.txt
    		y_test.txt
    		subject_test.txt
```
2. Combine each of the train and test type of files using 'rbind'
3. Transpose the feature names into a row/list for easy of use
4. Extract the column numbers for the feature columns which have "mean" and "std" in them
5. Extract the column names for the feature columns which have "mean" and "std" in them using the column numbers from #4
6. Extract the "std" and "mean" columns from the combined feature Dataset using the column numbers from #4
7. Now attach the activity (y) and subject column data to the extracted data from #4 using 'cbind'
8. Apply the names from #5 plus the subject and activity to the dataset in #7
9. Join the activity_labels with the data in #8 using merge on the acivity_num/id.
10. Remove the activity_num column
11. Group the data from #10 by Subject and ActivityName
12. Generate the mean of each mean/std columns for each group of Subject and ActivityName
13. Verify that all the data looks correct
14. Write the data to tidy_data.txt file using write.table


### Columns in the Tidy data

1. subject
2. ActivityName - this is the decriptive name of the Activity
3. All mean and std columns.  The *mean* columns contain the mean of the means of the features.  The *std* columns contain the means of the standard deviations of the features


