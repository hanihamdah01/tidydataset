# Getting and Cleaning Data Course Project

## Overview
This project processes the Human Activity Recognition Using Smartphones Dataset to produce a tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R
- Downloads and unzips data if needed
- Merges training and test datasets
- Extracts only measurements on the mean and standard deviation
- Uses descriptive activity names
- Labels data set with descriptive variable names
- Creates a second tidy data set with averages by activity and subject
- Outputs `tidy_data.txt`

## How to run
1. Open R or RStudio
2. Set working directory to the project folder
3. Run `source("run_analysis.R")`
4. The tidy data file `tidy_data.txt` will be created in the working directory
