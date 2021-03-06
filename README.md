# GettingandCleaningDataAssignment 
Getting and Cleaning Data Course Projectless 
The purpose of this project was to demonstrate your ability to collect, work with, and clean a data set. 
The goal was to prepare tidy data that can be used for later analysis. 

The files 
1) the Run_Analysis.R script
1) a tidy data set as described below called Tidy_Data.txt 
2) a code book called CodeBook.md. 

The data for this project an be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The Run_Analysis.R script does the following:

0. Downloads the data to you working directory
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
