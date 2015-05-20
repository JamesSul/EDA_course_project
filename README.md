# EDA_course_project

## Project description

The `run_analysis.R` script combines and reduces data from the [UCI study on Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Raw data description

There are two broad categories of data combined from the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), **test data** and **training data**.  There are two files that are used for both categories of data:

`features.txt` contains the variables measured and is used to populate the column names of the data. *Note: the raw data files do not contain a header.*

`activity_labels.txt` is a lookup for the `activity_code` that is captured in the data files.

Each *category* has data in three separate files:

`X_*.txt` contains the measurements for the 561 variables labeled in the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) files `features.txt`

`y_*.txt` contains the activity codes for the measured activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

`subject_test.txt` contains the identifier for each subject (1:30)

## Process

`run_analysis.R` combines the three data files described above **for each category** of data (training, test). It applies appropriate column names and keeps **only the measurements of mean and standard deviation**. This results in a reduction from 561 measurement variables to 79. For each of two data categories.

The training and test data are then combined to form a single dataset that is in a *wide* format and not tidy.

Finally, `run_analysis.R` transforms the dataset from *wide* to *long* and further reduces by aggregating on the mean of each measurement variable *for each subject's activity*. For details of the outputed tidy data, `wear_tidy.txt` see the [codebook](CodeBook.md)
