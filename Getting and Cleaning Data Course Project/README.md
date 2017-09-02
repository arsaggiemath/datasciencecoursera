# Getting and Cleaning Data Course Project

### Project Requirements

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The Assignemnt

1. Download the data at the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save to a folder called ```UCI HAR Dataset```.
2. Download ```run_analysis.R``` to one folder above the ```UCI HAR Dataset``` folder.
3. Use ```setwd()``` upon opening RStudio to make the folder containing ```run_analysis.R``` in Step 2 your working directory.
4. Run ```source("run_analysis.R")``` to run the script and generate a new tidy dataset called ```tidy.txt``` in your working directory.

### The Dependencies

There are two dependencies for this script which are ```data.table``` and ```reshape2```. However, the script checks and installs these packages if necessary. No work is required by the consumer.