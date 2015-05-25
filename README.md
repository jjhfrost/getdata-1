# Getting and Cleaning Data Assignment
The script "run_analysis.R" will read the files "activity_labels.txt", "subject_train.txt", "X_train.txt", "y_train.txt", "subject_test.txt", "X_test.txt", "y_test.txt".

1. Read "activity_labels.txt" and "y_train.txt",then merge together and bind to the data set which read from "subject_train.txt", saved as "train".
2. Read "X_train.txt" and calculate the mean and standard deviation, the bind to the data set "train".
3. Do the same steps for test set and get the data set "test".
4. Merge the data set "train" and "test".
5. Find the unique "subject-activity" value set "subjectActivity".
6. Loop the set "subjectActivity", calculate the average of the mean and standard deviation for each activity and each subject, saved as "secondDataSet".
7. output "secondDataSet" to the file "result.txt".
