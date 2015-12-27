# GetCleanData-Course-Project

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
