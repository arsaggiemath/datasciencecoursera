# Code Book

This code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.

### The Data Source

* A full description of the data source is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The full data for the project is avaiable here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### The Variables

The following files are included in the data download:

* ```README.txt```
* ```activity_labels.txt``` - List all of the class labels with the activity name.
* ```features.txt``` - List all of the features in this expirement.
* ```features_info.txt``` - List of information about the variables used on features.
* A folder named 'test' that contains the following:
    + ```subject_test.txt``` - Identifies the subject that performed the activity.
    + ```X_test.txt``` - The test set.
    + ```y_test.txt``` - The test labels.
    + A folder named 'Inertial Signals' that contains x, y, and z equivalents for the following:
        - ```body_acc_x_test.txt``` - Body acceleration by subtracting gravity from total acceleration.
        - ```body_gyro_x_test.txt``` - Angluar velocity from gyroscope.
        - ```total_acc_x_test.txt``` - Acceleration signal from smartphone accelerometer.
* A folder named 'train' that contains the following:
    + ```subject_train.txt``` - Identifies the subject that performed the activity.
    + ```X_train.txt``` - The train set.
    + ```y_train.txt``` - The train labels.
    + A folder named 'Inertial Signals' that contains x, y, and z equivalents for the following:
        - ```body_acc_x_train.txt``` - Body acceleration by subtracting gravity from total acceleration.
        - ```body_gyro_x_train.txt``` - Angluar velocity from gyroscope.
        - ```total_acc_x_train.txt``` - Acceleration signal from smartphone accelerometer.
        
### The Transformation

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The Implementation

This script does the same method for the test and train data sets and then merges them at the end. The method is desctibed below.

1. The script checks to see if the ```reshape2``` and ```data.table``` libraries are installed.
2. It then reads in the ```X_test```, ```y_test```, ```subject_test```, ```activity```, and ```features``` files.
3. It extracts only the mean and standard deviation columns.
4. It then appropriately lables the data set with the activity names.
5. Lastly it uses ```cbind``` to make a tidy data set with descriptive names.

This process is then repeated for the train data set and both tidy data sets are merged and written to the home directory under the name ```tidy.txt```.