## Project Description
This project involved taking data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and creating a tidy datafile that summarises the important variables.

##Study design and data processing

###Collection of the raw data
Taken from the README.txt file included in the original zip file.

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy data file, you must start by downloading the zip file from the link seen previously, and extract the files to a folder called UCI in the working directory of your R program.
Next, run the run_analysis.R script provided in this repo.
You should now find a file called tidyDF.txt in your working directory which can be read with the following code.

    data <- read.table("tidyDF.txt", header = TRUE) 
    View(data)

###Cleaning of the data
The data in the UCI folder is put together into one big data frame. Only columns pertaining to means or standard deviations are removed. The data is then grouped by subject and activity, and finally summarised by providing the mean of each variable.
More info is provided in https://github.com/INSdatascience/GetCleanData-Course-Project/blob/master/README.md

##Description of the tidyDF.txt file

180 observations of 68 variables
All data has been normalized and bouded within [-1,1]. This is how the original data was provided, and not a transformation done by the author.

###List of variables
"Subject"                     "Activity"                   
"tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
"tBodyAcc.mean...Z"           "tGravityAcc.mean...X"       
"tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
"tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
"tBodyAccJerk.mean...Z"       "tBodyGyro.mean...X"         
"tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
"tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
"tBodyGyroJerk.mean...Z"      "tBodyAccMag.mean.."         
"tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."     
"tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."    
"fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
"fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"      
"fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"      
"fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
"fBodyGyro.mean...Z"          "fBodyAccMag.mean.."         
"fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."    
"fBodyBodyGyroJerkMag.mean.." "tBodyAcc.std...X"           
"tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
"tGravityAcc.std...X"         "tGravityAcc.std...Y"        
"tGravityAcc.std...Z"         "tBodyAccJerk.std...X"       
"tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
"tBodyGyro.std...X"           "tBodyGyro.std...Y"          
"tBodyGyro.std...Z"           "tBodyGyroJerk.std...X"      
"tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
"tBodyAccMag.std.."           "tGravityAccMag.std.."       
"tBodyAccJerkMag.std.."       "tBodyGyroMag.std.."         
"tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"           
"fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
"fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
"fBodyAccJerk.std...Z"        "fBodyGyro.std...X"          
"fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
"fBodyAccMag.std.."           "fBodyBodyAccJerkMag.std.."  
"fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.." 

###Variable 1 - Subject
Subject number (int), ranging from 1 to 30

###Variable 2 - Activity
Activity name (chr) : Laying, Sitting, Standing, Walking, Walking_Downstairs, Walking_Upstairs

###Variable 3 to 68
Taken from the features_info.txt file included in the original zip file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

From these variables, menas and standard deviations were calculated.
All variables are numeric, without unit of measurements.
