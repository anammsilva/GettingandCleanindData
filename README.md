#GettingandCleanindData
#Coursera Course

#The file run_analysis.R has the instuctions to answer the following questions:
*1.Merges the training and the test sets to create one data set.
*2.Extracts only the measurements on the mean and standard deviation for each measurement. 
*3.Uses descriptive activity names to name the activities in the data set
*4.Appropriately labels the data set with descriptive variable names. 
*5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

We start with importing files about Human Activity Recognition Using Smartphones Data Set:
1. We import activity labels, which import six categories' names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS SITTING, STANDING,LAYING.\\
2. After that, we import the features, which has length 561.
3. Then, we import the test sets related to each categorie: "xtest" realated to features, and "ytest" related to activity labels, and,
finaly, about the subject test, which indicates the id of the subject. After this, we merge the three of them.
4. We do the same thing to the train data.

Finally, we merge the two of them, obtaining a matrix with 10299rows * 82columns

For answering the questions, we used the packages "data.table" and "reshape2" )
