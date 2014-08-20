if (!file.exists("data")){
        dir.create("data")
}
if (!file.exists("data/UCI HAR Dataset.zip")){
        # Download the data if it has not been downloaded before
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "data/UCI HAR Dataset.zip")
}
# Unzip the downloaded file
unzip("data/UCI HAR Dataset.zip", exdir = "data")

# Read data
test_x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
training_x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
training_y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
training_subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
# Merge training and test datasets
merged_x <- rbind(test_x,training_x)
merged_y <- rbind(test_y,training_y)
merged_subject <- rbind(test_subject,training_subject)

#Extracting mean and std for each measurement of dataset 'merged_x'
#Read 'feature' list file
features <- read.table("data/UCI HAR Dataset/features.txt")
#Locating mean and standard deviation columns
col_mean <- sapply(features[,2], function(x) grepl("mean()",x,fixed=T))
col_std <- sapply(features[,2], function(x) grepl("std()",x,fixed=T))
#Extract the chosen columns from the dataset and give the right column names
extracted_df <- merged_x[ ,(col_mean | col_std)]
colnames(extracted_df) <- features[(col_mean | col_std),2]

#Use descriptive activity names to name the activities in the dataset
merged_y$V1[merged_y$V1 == 1] = "WALKING"
merged_y$V1[merged_y$V1 == 2] = "WALKING_UPSTAIRS"
merged_y$V1[merged_y$V1 == 3] = "WALKING_DOWNSTAIRS"
merged_y$V1[merged_y$V1 == 4] = "SITTING"
merged_y$V1[merged_y$V1 == 5] = "STANDING"
merged_y$V1[merged_y$V1 == 6] = "LAYING"

#Bind the activity and subject columns to the extracted_df
#Labels the columns appropriately
new_dataframe <- cbind(merged_subject,merged_y,extracted_df)
colnames(new_dataframe)[1] <- "Subject"
colnames(new_dataframe)[2] <- "Activity"

library(plyr)
#Creating tidy data set with averages for each subject and activity
tidy_dataset <- ddply(new_dataframe, .(Subject, Activity), function(x) colMeans(x[,3:68]))

#Uploading data to submit on Coursera
write.table(tidy_dataset, "data/tidy_dataset.txt", row.name=FALSE)
