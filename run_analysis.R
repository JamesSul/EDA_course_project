## Course Project for Exploratory Data Analysis
## assumes all files have already been extracted to a folder named uci_har_dataset
## in the working directory. Note: folder was renamed from default
## for easier reference.
library(tidyr)
library(dplyr)

## read the test data (if I were doing this more than twice I'd write a function).

# read test data (X_test.txt), feature data(features.txt) and 
# add features as column names
x.test <- read.table("./uci_har_dataset/test/X_test.txt", header=FALSE, sep="")
features <- read.table("./uci_har_dataset/features.txt", header=FALSE, sep="")
colnames(x.test) <- features[,2]

# keep only the columns with -mean() and -std()
# note: there are other columns that have the word mean in them
# but I am not including those columns based on the following post
# in the discussion forums...
# https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions
good_cols <- grepl('-mean()|-std()',features[,2])
x.test <- x.test[,good_cols]

# read in subject id (subject_test.txt), codes for activity data (y_test.txt), and labels
subj.test <- read.csv("./uci_har_dataset/test/subject_test.txt", header=FALSE)
y.test <- read.csv("./uci_har_dataset/test/y_test.txt", header=FALSE)
activity.labels <- read.table("./uci_har_dataset/activity_labels.txt", header=FALSE, sep="")
colnames(activity.labels) <- c("activity_code","activity_label")

# add meaningful column names for subject and activity
colnames(subj.test) <- "subj_id"
colnames(y.test) <- "activity_code"

# create a data frame combining the three datasets
test.data <- cbind(x.test, subj.test, y.test)

## read the training data

# read test data (X_train.txt), and add features as column names
x.train <- read.table("./uci_har_dataset/train/X_train.txt", header=FALSE, sep="")
colnames(x.train) <- features[,2]

# keep only the columns with -mean() and -std()
x.train <- x.train[,good_cols]

# read in subject id (subject_train.txt), and codes for activity data (y_train.txt)
subj.train <- read.csv("./uci_har_dataset/train/subject_train.txt", header=FALSE)
y.train <- read.csv("./uci_har_dataset/train/y_train.txt", header=FALSE)

# add meaningful column names for subject and activity
colnames(subj.train) <- "subj_id"
colnames(y.train) <- "activity_code"

# create a data frame combining the three datasets
training.data <- cbind(x.train, subj.train, y.train)

# combine the two data frames
wearables <- rbind(training.data, test.data) # project item 1-2 complete

# add activity labels
wearables <- merge(wearables, activity.labels, by = "activity_code") # project items 3-4 complete


## create a second, independent tidy data set
## with the average of each variable for each
## activity and subject

# convert from wide to long
# columns 80 and 81 are subj_id and activity_label
categories <- c("subj_id", "activity_label")
wear_long <- wearables %>% select(-activity_code) %>% gather(variable, measurement, 1:79) %>%
        group_by(subj_id, activity_label, variable) %>% summarize( mean = mean(measurement))

# write to file (to working directory)
write.table(wear_long, "wear_tidy.txt", row.name=FALSE)
