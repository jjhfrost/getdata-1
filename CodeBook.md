activityLabel: Activity Label, read from activity_labels.txt.
activity: Activity set, read from y_train.txt
train: train set, read from subject_train.txt, then bind the activity, activity label, the mean and standard deviation.
temp: train set,read from X_train.txt or X_test.txt, for calculating the mean and standard deviation.
test: test set, read from subject_test.txt, then bind the activity, activity label, the mean and standard deviation.
all: merged train set and test set.

secondDataSet: the second data set for step 5.
subjectActivity: save the unique subject and activity.
tempmean: the average of the mean and standard deviation for each activity and each subject.
