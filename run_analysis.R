> install.packages("dplyr")
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/dplyr_1.1.4.tgz'
Content type 'application/x-gzip' length 1614595 bytes (1.5 MB)
==================================================
downloaded 1.5 MB


The downloaded binary packages are in
	/var/folders/qk/lchqz71s50zd7tzyk_fz6c4r0000gn/T//RtmpEwkfsQ/downloaded_packages
> 
> library(dplyr)
Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union
> 
> # run_analysis.R
> 
> # Load necessary libraries
> library(dplyr)
> 
> # Download and unzip data if not already present
> if(!file.exists("UCI HAR Dataset")) {
+     fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
+     download.file(fileUrl, destfile = "dataset.zip", method = "curl")
+     unzip("dataset.zip")
+ }
> 
> # Read activity labels and features
> activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
> features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "feature"))
> 
> # Extract mean and std features only
> features_wanted <- grep("mean\\(\\)|std\\(\\)", features$feature)
> features_names <- features$feature[features_wanted]
> 
> # Load training data
> subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
> x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[, features_wanted]
> y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
> 
> # Load test data
> subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
> x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[, features_wanted]
> y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
> 
> # Merge train and test data
> subject <- rbind(subject_train, subject_test)
> activity <- rbind(y_train, y_test)
> features_data <- rbind(x_train, x_test)
> 
> # Combine all data into one data frame
> data <- cbind(subject, activity, features_data)
> 
> # Use descriptive activity names
> data$activity <- factor(data$activity, levels = activity_labels$id, labels = activity_labels$activity)
> 
> # Clean column names
> names(data)[3:ncol(data)] <- gsub("\\(\\)", "", features_names)
> names(data)[3:ncol(data)] <- gsub("-", "_", names(data)[3:ncol(data)])
> names(data)[3:ncol(data)] <- tolower(names(data)[3:ncol(data)])
> 
> # Create tidy data set with average for each subject and activity
> tidy_data <- data %>%
+     group_by(subject, activity) %>%
+     summarise_all(mean)
> 
> # Write tidy data to file
> write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
