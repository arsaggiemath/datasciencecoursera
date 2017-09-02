if (!require("data.table")) {
    install.packages("data.table")
}
if (!require("reshape2")) {
    install.packages("reshape2")
}

#Read in the data we need for the assignment.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# WORKING WITH THE TEST DATA SETS

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(x_test) <- features

# 2.Extracts only the measurements on the mean and standard deviation
#   for each measurement.
extracts <- grepl("mean|std", features)
x_test <- x_test[, extracts]

y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("ActivityID", "ActivityLabel")
names(subject_test) <- "Subject"

test <- cbind(as.data.table(subject_test), y_test, x_test)


# DO THE SAME FOR TRAIN DATA SETS

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(x_train) <- features

# 2.Extracts only the measurements on the mean and standard deviation
#   for each measurement.
extracts <- grepl("mean|std", features)
x_train <- x_train[, extracts]

y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("ActivityID", "ActivityLabel")
names(subject_train) <- "Subject"

train <- cbind(as.data.table(subject_train), y_train, x_train)

# BRINGING IT ALL TOGETHER

# 1. Merges the training and the test sets to create one data set.
full_data <- rbind(test, train)

# 3. Uses descriptive activity names to name the activities in the data set
id_label_vector <- c("Subject", "ActivityID", "ActivityLabel")

# 4. Appropriately labels the data set with descriptive variable names.
data_label_vector <- setdiff(colnames(data), id_label_vector)
melting <- melt(full_data, id = id_label_vector
                , measure.vars = data_label_vector)

# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
tidy <- dcast(melting, Subject + ActivityLabel ~ variable, mean)
write.table(tidy, file = "./tidy.txt", row.name = FALSE)