The run_analysis.R is the code script for the assignment of course Getting and Cleaning Data to fulfill data preparation.

It performs in the following steps:

1. Download and extract the dataset.
The source data are from the Human Activity Recognition Using Smartphones Data Set. 
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Read in the files and merging the training and the test sets to one data set.
Reading files include trainings tables, testing tables, feature vector, activity labels. All the read-in data merge into one data set.

3. Extracting data that includes the measurements on the mean and standard deviation for each measurement.

4. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

5. Write the second tidy data set (tidydata.txt) as the output file.

Variables in the run_analysis.R script are listed as following:

X_train, Y_train, X_test, Y_test, subject_train and subject_test are the data extracted from the downloaded files.
X_total, Y_total and subject are the data which merge the previous datasets.
features and activities are the data set which have the correct names for the X_total and Y_total dataset.
