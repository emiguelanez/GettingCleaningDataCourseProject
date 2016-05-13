# Getting and Cleaning Data Course Project
# Codebook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
   1. Read the features from file *features.txt*, and store in variable *features*. From this variable, obtain the name of the features and stored in variable *feature_names*.
   2. Read the activity labels from file *activity_labels.txt* and store in variable *activity_labels*
   3.  Read training data, labels and subject, and store in variables *X_train*, *y_train*, and *subject_train*. Reassign column names for these data, especially for the *X_train* with *feature_names*. Create new column to determine if data is for training or testing.
   4. Perform same work as previous step, but for test data.
   5. The next obvious step is to merge *train_data* and *test_data* using rbind. The merge data is stored in variable *onedataset*
   6. Now, the measurements of the mean and standard deviation are extracted using function `grep(mean\\(\\)|std\\(\\) ...`, obtaining the column index and create *finaldata*
   7. The next step is to factorize variable *activity* in the *finaldata* using descriptive activity names, but renaming levels of the column using *activity_labels*
   8. Using function *gsub()*, the labels of the data set are appropriately named with descriptive variables names.
   9. Finally, a second independent tidy data set using function *aggregate()* and write out the final data into *tidydata.txt*