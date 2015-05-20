# Codebook 
*for wear_tidy.txt*

The `wear_tidy.txt` file was created from the training and test data sets from the [UCI Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project. The raw data is available from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The `wear_tidy.txt` file is a single-space delimited text file, with a header, containing 14,220 observations and the following four columns:

`subj_id` - The unique identifier for each subject in the study (ranges from 1:30)

`activity_label` - The self reported, recorded activity from a choice of six activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

`variable` - The variable label of the measured activity in the study. See the `features.txt` and `features_info.txt` files in the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for more info. *Note: the variables chosen were the mean and standard deviation measures resulting in a reduction from 561 variables to 79*

`mean` - which is a numeric field representing the mean of the specified variable **for each subject's activity**.

