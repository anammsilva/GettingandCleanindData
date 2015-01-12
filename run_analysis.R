#install and load packages
install.packages("data.table")
require(data.table)
install.packages("reshape2")
require(reshape2)

##################

#import data
#activity labels
actlab <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#features
feat <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Test sets
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Merge all test sets
test <- cbind(as.data.table(subjecttest), ytest, xtest)

#Import training data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(xtrain) = feat
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(xtest) = names(xtrain)
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Merge train data
train<- cbind(as.data.table(subjecttrain), ytrain, xtrain)


##############################
#1. Merges the training and the test sets to create one data set.
data = rbind(train, test, fill=T)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
extractfeats <- grepl("mean|std", feat)
xtrain = xtrain[,extractfeats]
xtest = xtest[,extractfeats]

#3. Uses descriptive activity names to name the activities in the data set
ytrain[,2] = actlab[ytrain[,1]]
ytest[,2] = actlab[ytest[,1]]


#4.Appropriately labels the data set with descriptive variable names. 
#update files
train<- cbind(as.data.table(subjecttrain), ytrain, xtrain)
test<- cbind(as.data.table(subjecttest), ytest, xtest)

data = rbind(train, test)

names(ytrain) = c("Activity_Number", "Activity_Name")
names(subjecttrain) = "Subject"
names(data)<-c(names(subjecttrain), names(ytrain), names(xtrain))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meltdata<- melt(data, id.vars=c("Subject", "Activity_Name"))
tidydata<-dcast(meltdata, Subject + Activity_Name ~ variable, mean)


write.table(tidydata, file = "./tidymean.txt", row.name=FALSE)




