# Download the dataset
 filename <- "Dataset.zip"

if(!file.exists(filename)){
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "/Users/jing/Desktop/coursera/Dataset.zip", method="curl")
}

 # unzip dataset
 unzip(zipfile = "/Users/jing/Desktop/coursera/Dataset.zip", exdir = "/Users/jing/Desktop/coursera")

 setwd("/Users/jing/Desktop/coursera/UCI HAR Dataset")
 
# Read training datasets
X_train <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/train/subject_train.txt")


# Read test datasets
X_test <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/test/subject_test.txt")


# Read feature vector description
features <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/features.txt")

#  Read activity labels
activities <- read.table("/Users/jing/Desktop/coursera/UCI HAR Dataset/activity_labels.txt")

# Merge the training and the test sets to one data set

X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
subject <- rbind(subject_train, subject_test)

# create sub dataset of the measurements on the mean and standard deviation for each measurement.
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

X_total <- X_total[,selected_var[,1]]

# label the data set with activity and variable names

colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activities[,2]))
activitylabel <- Y_total[,-1]


colnames(X_total) <- features[selected_var[,1],2]

# Creates a second, independent tidy data set with the mean
# of each variable for each activity and each subject.
colnames(subject_total) <- "subject"
total <- cbind(X_total, activitylabel, subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))

# Get the required tidydata.txt 
write.table(total_mean, file = "/Users/jing/Desktop/coursera/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


