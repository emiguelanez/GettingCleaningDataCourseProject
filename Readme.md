# Getting and Cleaning Data Course Project

This document describes the code inside `run_analysis.R`, detailing the variables, the data, and any transformations or work that I have performed to clean up the data.

The site where the data was obtained:
   - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
   - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   - Prior to the execution of this script, the data should be downloaded and unzipped under the data folder
 
The code is splitted (by comments) describing each task required for the assigment. 
  - Load the required libraries
  - Getting the feature names
  - Getting the activbity labels
  - Getting and preparing the training data
  - Getting and preparing the testing data
  - Merge training and testing datasets
  - Extracts only the measurements of the mean and standard deviation
  - Factorize variable 'activity' in the data using descriptive activity names
  - Appropriately labels the data set with descriptive variable names
  - Creates a second independent tidy data set