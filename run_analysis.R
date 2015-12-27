library(dplyr)
#read features, remove first column, transpose
features <- read.table("./UCI/features.txt")
features <- features %>% select(V2) %>% t

#put the "test" pieces together, using features as column names (4.labeling data with descriptive variable names)
xtest <- read.table("./UCI/test/X_test.txt", col.names = features)
ytest <- read.table("./UCI/test/y_test.txt")
subjecttest <- read.table("./UCI/test/subject_test.txt")
test <- cbind(subjecttest, ytest, xtest)
colnames(test)[1] <- "Subject"
colnames(test)[2] <- "Activity"

#repeat for "train"
xtrain <- read.table("./UCI/train/X_train.txt", col.names = features)
ytrain <- read.table("./UCI/train/y_train.txt")
subjecttrain <- read.table("./UCI/train/subject_train.txt")
train <- cbind(subjecttrain, ytrain, xtrain)
colnames(train)[1] <- "Subject"
colnames(train)[2] <- "Activity"

#put it all together (1. merge training and test sets to create one data set)
bigDF <- rbind(test, train)

#find the position of the variables you want to keep
#save as.numeric, add 2 to every number because the first 2 rows are now Subject/Activity
where <- as.numeric(c(grep("mean", features),grep("std", features)))
where <- where + 2

#remove the variables we don't need (2.Extracts only the measurements on the mean and standard deviation for each measurement)
subsetbigDF <- select(bigDF, Subject, Activity, where)
#remove meanFreq
nope <- as.numeric(grep("Freq", colnames(subsetbigDF)))
subsetbigDF <- select(subsetbigDF, -(nope))

#name the activities (3.Uses descriptive activity names to name the activities in the data set)
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("1", "Walking", Activity))
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("2", "Walking_Upstairs", Activity))
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("3", "Walking_Downstairs", Activity))
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("4", "Sitting", Activity))
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("5", "Standing", Activity))
subsetbigDF <- mutate(subsetbigDF, Activity = gsub("6", "Laying", Activity))

#create final data frame (5.creates a second, independent tidy data set with the average of each variable for each activity and each subject)
tidyDF <- subsetbigDF %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(tidyDF, "tidyDF.txt", row.names = FALSE)