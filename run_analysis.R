# we would be using the dplyr package.  If you don't have this already please run 'install.packages("dplyr")' first 
library(dplyr)

# Read various training data.  
# The assumption is that the "UCI HAR Dataset" directory is a sub-directory of where you are running the script from
train_feature <- read.table("UCI HAR Dataset/train/X_train.txt",  header=F)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",  header=F)
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt",  header=F)

# Read various test data
test_feature <- read.table("UCI HAR Dataset/test/X_test.txt",  header=F)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt",  header=F)
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt",  header=F)

# combine train and test data
all_features <- rbind(train_feature, test_feature)
all_subject <- rbind(train_subject, test_subject)
all_activity <- rbind(train_activity, test_activity) 


# read the feature names
feature_names <- read.table("UCI HAR Dataset/features.txt",  header=F)

# need to transpose the feature names to get it in a row
feature_names <- c(t(feature_names[2]))

# extract the mean and std column numbers
mean_column_numbers <- grep("mean()", feature_names)
std_column_numbers <- grep("std()", feature_names)

# extract only the mean and std columns from the feature data
mean_and_std_features <- all_features[, c(mean_column_numbers, std_column_numbers)] 

# combine the mean/std feature data with the subject and their activity data
features_subject_activity <- cbind(mean_and_std_features, all_subject, all_activity)

#  get the mean and std featurenames from their columns
mean_std_featurenames <- feature_names[c(mean_column_numbers, std_column_numbers)]

# clean the names by removing ().  Note ( is a special char and hence need to be escaped
clean_featurenames <- sub("\\()", "", mean_std_featurenames)

# apply the names to the data set
names(features_subject_activity) <- c(clean_featurenames, "Subject", "activity_num")

# read activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",  header=F)
names(activity_labels) <- c("activity_num", "ActivityName")


# merge dataset with activity labels to get descriptive activity names
features_subject_activityname <- merge(features_subject_activity, activity_labels, b.x="activity_num", b.y="activity_num", all=F)

# remove activity_num column as we don't need that anymore.  THIS IS STEP# 4 OUTPUT
features_subject_activityname <- select(features_subject_activityname, -activity_num)


# STEP 5 starts here
# group the data from step# 4 by Subject and ActivityName
features_grouped_by_subject_activityname <- group_by(features_subject_activityname, Subject, ActivityName)

# summarize each group by running means on each feature.  
summarized_means_by_subject_activityname <- summarise_each(features_grouped_by_subject_activityname, funs(mean))

# write the output of step5 to a file
write.table(summarized_means_by_subject_activityname, file="tidy_data.txt", row.names=F)

# WE ARE DONE!
