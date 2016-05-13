# Load the libraries
library(plyr)
# Getting features names
features <- read.table("./data/UCI HAR Dataset/features.txt")
features_names <- as.character(features$V2)

# Getting activity labels
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

# Getting Training data
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
names(X_train) <- features_names
names(y_train) <- c("activity")
names(subject_train) <- c("subject")
train_label <- data.frame(rep(1,dim(subject_train)[1]))
names(train_label) <- c("set")
train_data <- cbind(y_train,subject_train,train_label,X_train)

# Getting Testing data
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
names(X_test) <- features_names
names(y_test) <- c("activity")
names(subject_test) <- c("subject")
test_label <- data.frame(rep(2,dim(subject_test)[1]))
names(test_label) <- c("set")
test_data <- cbind(y_test,subject_test,test_label,X_test)

# Merge training and test sets
onedataset <- rbind(train_data, test_data)

#Extracts only the measurements of the mean and standard deviation
idx <- sort(c(1,2,3,grep("mean\\(\\)|std\\(\\)",names(onedataset))))
finaldata <- onedataset[idx]

# Factorize variable 'activity' in the data using descriptive activity names
finaldata$activity <- as.factor(finaldata$activity)
levels(finaldata$activity) <- activity_labels$V2

# Appropriately labels the data set with descriptive variable names
names(finaldata)<-gsub("^t", "time", names(finaldata))
names(finaldata)<-gsub("^f", "frequency", names(finaldata))
names(finaldata)<-gsub("Acc", "Accelerometer", names(finaldata))
names(finaldata)<-gsub("Gyro", "Gyroscope", names(finaldata))
names(finaldata)<-gsub("Mag", "Magnitude", names(finaldata))
names(finaldata)<-gsub("BodyBody", "Body", names(finaldata))

# Creates a second independent tidy data set
finaldata2<-aggregate(. ~subject + activity, finaldata, mean)
finaldata2<-finaldata2[order(finaldata2$subject,finaldata2$activity),]
write.table(finaldata2, file = "tidydata.txt",row.name=FALSE)
