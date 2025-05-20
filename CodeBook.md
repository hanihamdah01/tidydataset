# Code Book for Getting and Cleaning Data Project

## Data Source
The dataset used is the Human Activity Recognition Using Smartphones Dataset from UCI Machine Learning Repository.

## Variables
- `subject`: Identifier of the subject who performed the activity (1-30)
- `activity`: The activity performed (e.g., WALKING, SITTING)
- The remaining variables are averages of mean and standard deviation measurements for various signals captured by the smartphone accelerometer and gyroscope. All variable names are lowercase and use underscores.

## Transformations
- Combined training and test datasets
- Extracted measurements on the mean and standard deviation only
- Replaced activity IDs with descriptive names
- Cleaned variable names by removing parentheses and replacing dashes with underscores
- Created a tidy dataset summarizing averages for each variable by subject and activity

