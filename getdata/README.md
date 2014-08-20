---
title: "README.md"
author: "HelenevH"
date: "Wednesday, August 20, 2014"
output: html_document
---

This repository contains R code file 'run_analysis.R' in which data is downloaded on Human Activity Recognition and in which several preprocessing actions are performed on this data. Below I will shortly explain the steps performed to the original data which can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script called runanalysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

A more detailed explanation of the steps taken in the R script, see the remarks in the code. 

For more information on the variables in the tidy data set, see the Codebook.