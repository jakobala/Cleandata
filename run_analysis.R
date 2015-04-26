#FILE PATH=~/Documents/Coursera-Courses_material/Cleaning\ data/
#1 Merges the training and the test sets to create one data set.
tableTrainset<-read.table("UCI HAR Dataset/train/X_train.txt")
tableTestset<-read.table("UCI HAR Dataset/test/X_test.txt")
tableBothsets<-rbind(tableTrainset,tableTestset)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
vectorMean<-c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,345,346,347,424,425,426,503,516,529,542)
vectorStd<-c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
tableMean<-tableBothsets[,vectorMean]
tableStd<-tableBothsets[,vectorStd]

#3 Uses descriptive activity names to name the activities in the data set
tableActivities<-read.table("UCI HAR Dataset/features.txt")

#4 Appropriately labels the data set with descriptive variable names.
tableLabeled<-data.frame(tableBothsets)
colnames(tableLabeled)<-as.vector(tableActivities[,2])
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tableAverageLabeled<-tableLabeled[,vectorMean]
finalDataset<-colMeans(tableAverageLabeled)
write.table(finalDataset,"independent_tidy_data_set.txt",col.names=FALSE)



