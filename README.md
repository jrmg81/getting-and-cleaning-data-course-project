# getting-and-cleaning-data-course-project
Final assignment for getting and cleaning data course

The file run_analysis.R has only one function named run.
This functions performes this way:

1 - The files /train/subject_train.txt, /train/y_train.txt and /train/X_train.txt are read and columns
    combined to get one data frame
    
2 - The files /test/subject_train.txt, /test/y_train.txt and /test/X_train.txt are read and columns
    combined to get one data frame
    
3 - Since data frame from step 1 and data frame from step 2 have same columns, rows are combined to get
    one data frame
    
4 - For each row from data frame from step 3 only are kept subject and activity columns, and all those
    columns that represent a mean or standard deviation measurement
    
5 - For each row from data frame from step 4 activity column values are changed from number to its
    corresponding activity label
    
    1 = WALKING
    2 = WALKING_UPSTAIRS
    3 = WALKING_DOWNSTAIRS
    4 = SITTING
    5 = STANDING
    6 = LAYING
    
6 - Column names from data frame from step 5 are renamed to more descriptive variable names
7 - Finally, rows from data frame from step 6 are grouped by subject and activity, and average calculated
    for the rest of the variables. The result is a data frame with unique subject-activity observations
    and their average for each variable.
