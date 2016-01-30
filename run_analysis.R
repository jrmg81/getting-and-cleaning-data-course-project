library(dplyr)

run <- function() {
  strain <- read.csv('./UCI HAR Dataset/train/subject_train.txt', header = FALSE)
  ytrain <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE)
  xtrain <- read.csv('./UCI HAR Dataset/train/X_train.txt', sep = "", header = FALSE)
  stest <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE)
  ytest <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE)
  xtest <- read.csv('./UCI HAR Dataset/test/X_test.txt', sep = "", header = FALSE)
  train <- cbind(strain, ytrain, xtrain)
  test <- cbind(stest, ytest, xtest)
  data <- rbind(train, test)
  meanstd <- data[, c(1, 2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86, 87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166, 167, 168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428, 429, 430, 431, 505, 506, 518, 519, 531, 532, 544, 545)]
  meanstd[, 2] <- sapply(meanstd[, 2], function(x) { if (x == 1) 'WALKING' else if (x == 2) 'WALKING_UPSTAIRS' else if (x == 3) 'WALKING_DOWNSTAIRS' else if (x == 4) 'SITTING' else if (x == 5) 'STANDING' else 'LAYING'})
  colnames(meanstd) <- c('subject', 'activity', 'timebodyaccxmean', 'timebodyaccymean', 'timebodyacczmean', 'timebodyaccxstd', 'timebodyaccystd', 'timebodyacczstd', 'timegravityaccxmean', 'timegravityaccymean', 'timegravityacczmean', 'timegravityaccxstd', 'timegravityaccystd', 'timegravityacczstd', 'timebodyaccjerkxmean', 'timebodyaccjerkymean', 'timebodyaccjerkzmean', 'timebodyaccjerkxstd', 'timebodyaccjerkystd', 'timebodyaccjerkzstd', 'timebodygyroxmean', 'timebodygyroymean', 'timebodygyrozmean', 'timebodygyroxstd', 'timebodygyroystd', 'timebodygyrozstd', 'timebodygyrojerkxmean', 'timebodygyrojerkymean', 'timebodygyrojerkzmean', 'timebodygyrojerkxstd', 'timebodygyrojerkystd', 'timebodygyrojerkzstd', 'timebodyaccmagmean', 'timebodyaccmagstd', 'timegravityaccmagmean', 'timegravityaccmagstd', 'timebodyaccjerkmagmean', 'timebodyaccjerkmagstd', 'timebodygyromagmean', 'timebodygyromagstd', 'timebodygyrojerkmagmean', 'timebodygyrojerkmagstd', 'frequencybodyaccxmean', 'frequencybodyaccymean', 'frequencybodyacczmean', 'frequencybodyaccxstd', 'frequencybodyaccystd', 'frequencybodyacczstd', 'frequencybodyaccjerkxmean', 'frequencybodyaccjerkymean', 'frequencybodyaccjerkzmean', 'frequencybodyaccjerkxstd', 'frequencybodyaccjerkystd', 'frequencybodyaccjerkzstd', 'frequencybodygyroxmean', 'frequencybodygyroymean', 'frequencybodygyrozmean', 'frequencybodygyroxstd', 'frequencybodygyroystd', 'frequencybodygyrozstd', 'frequencybodyaccmagmean', 'frequencybodyaccmagstd', 'frequencybodybodyaccjerkmagmean', 'frequencybodybodyaccjerkmagstd', 'frequencybodybodygyromagmean', 'frequencybodybodygyromagstd', 'frequencybodybodygyrojerkmagmean', 'frequencybodybodygyrojerkmagstd')
  subjectactivity <- group_by(meanstd, subject, activity)
  summarise_each(subjectactivity, funs(mean))
}
