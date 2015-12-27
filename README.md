# GetCleanData-Course-Project

The script found in this repo, run_analysis.R, will take the wearable computing data found in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, saved in your work directory in a folder called UCI,
and will output a summarized data frame that will provide the means of specific variables.

It starts by using the features list as colnames when the X_test.txt and X_train.txt are read.
It then binds in order the subject_test.txt, y_test.txt and X_test.txt together, and repeats the process for the train data.
Then, it identifies which variables we want to keep, and removes the those we don't.
It then renames the activities.
Finally, the summarised tidy data frame is created and written, providing the mean of every variable for each subject and activity.

The final data frame, tidyDF.txt, is considered tidy in the wide format, as it follows the three rules stated in Hadley Wickam's Tidy Data (http://vita.had.co.nz/papers/tidy-data.pdf).

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

We see there is a row for each subject and the activity they were each doing. Similarly, there is a column for the mean value for each measure.

I chose to use the features as the descriptive variable names. The features_info.txt included in the original folder already explains the meaning of each variable. The variables I decided to isolate were any who included "mean" or "std" in the variable name. Attention was put to erase those variables that were in fact meanFreq measures.

Activity names were taken straight from the activity_labels.txt file included in the original folder. The 1:6 number code used in the data frame was simply replaced with the actual activity names.

The code needed to look at the final tidy data is

    data <- read.table(file_path, header = TRUE)
    View(data)
