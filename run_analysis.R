#####################################################################################################
# run_analysis.R for the Coursera Data Gathering and Clensing Assignment Course Project
#
# General Background:
# One of the most exciting areas in all of data science right now is wearable computing - see 
# for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop 
# the most advanced algorithms to attract new users. The data linked to from the course website 
# represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full 
# description is available at the site where the data was obtained: 
#
#
# Coursea Project
# The purpose of this project is to demonstrate your ability to collect, work with, and clean
# a  data set. The goal is to prepare tidy data that can be used for later analysis. This will
# be graded by peers on a series of yes/no questions related to the project. 
#
# Project Requirements: 1) a tidy data set as described below, 
#                       2) a link to a Github repository with your script for performing the analysis, and 
#                       3) a code book that describes the variables, the data, and any transformations or 
#                          work that you performed to clean up the data called CodeBook.md. 
#                          You should also include a README.md in the repo with your scripts. 
#                          This repo explains how all of the scripts work and how they are connected.  
#
#####################################################################################################
# This R Script is run_analysis.R and does the following. 
#
# 1 . Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names. 
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average 
#     of each variable for each activity and each subject.
#####################################################################################################
## STEP 0. Set up the environment:
#  STEP 0a.  Runtime Flags - MANUALLY SET THESE   Zero(0) means do not run the code for this flag

currentdirectory_flag <- 1     #  Set flag if current directory is not the Assignment
Packages_flag         <- 1     #  Set flag if the Packages required for this script are not in the Users' Environment
Library_flag          <- 1     #  Set flag if libraries have not been pulled into the current environment
download_flag         <- 1     #  Set flag if download and unzip required
readinfiles_flag      <- 1     #  Set flag if the files need to be read into R Global Environment

#     Restart Value denotes where to start in the script - a value of 999 means run nothing
restart_step          <- 1     #   eg 2 means start at step2 and run all subsequent steps
  
# Based on the value set in the Runtime Flags set up the environment and input
# STEP 0b. Set working directory, 
if (currentdirectory_flag == 1)  {      # only do the setwd command if the flag is manually set
  setwd("C:/Education/Data Science - Coursera/03 Getting and Cleaning Data/Assignment")
}
# STEP 0c. Install Packages, 
if (Packages_flag == 1)  {      # only do the Packages commands if the flag is manually set
  install.packages("dplyr")
  install.packages("httr")
  install.packages("tidyr")
  install.packages("plyr")
  install.packages("reshape")
  install.packages("reshape2")  
  install.packages("downloader")
}
# STEP 0d. Use libraries, 
if (Library_flag == 1)  {      # only do the library commands if the flag is manually set
  library(dplyr)
  library(httr)
  library(tidyr)
  library(plyr)
  library(reshape)
  library(reshape2)
  library(downloader)    # required for the 'unzip' command
  print("Libraries loaded")
}
# STEP 0e. Download file and unzip it into the Project directory
if (download_flag == 1)  {
  ds1url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dateDownloaded <- date()
  download.file(ds1url, dest="Project.zip", mode="wb") 
  if(!file.exists("./Project")) {dir.create("./Project")}
  unzip ("Project.zip", exdir = "./Project")
}
# STEP 0f. Read file into global environment
if (readinfiles_flag == 1)  {      # only do the read commands if the flag is manually set
  file_xtrain     <- read.table("./Project/UCI HAR Dataset/train/X_train.txt",  sep="")
  file_ytrain     <- read.table("./Project/UCI HAR Dataset/train/y_train.txt",  sep="")
  file_strain     <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt",  sep="")
  file_xtest      <- read.table("./Project/UCI HAR Dataset/test/X_test.txt",  sep="")
  file_ytest      <- read.table("./Project/UCI HAR Dataset/test/y_test.txt",  sep="")
  file_stest      <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt",  sep="")
  file_features   <- read.table("./Project/UCI HAR Dataset/features.txt", sep="")
  file_activities <- read.table("./Project/UCI HAR Dataset/activity_labels.txt", sep="")
  print("read in files complete")
}

####################################################################################
# STEP 1. Combine all rows for each file type - Activity, Subject and Data
####################################################################################
if (restart_step <= 1)  {
  allactivity <-rbind(file_ytrain,file_ytest)
  allsubject  <-rbind(file_strain,file_stest)
  alldata     <-rbind(file_xtrain,file_xtest)
  print("Step1 complete")
}
###########################################################################
# STEP 2. Replace 
#     a.    Column names V1...Vnnnn with something more descriptive
#     b.    Activity codes in rows with their actual description
#     c.    Also replaces columns like tBodyAccJerkMag... with 
#                                 Time_Body_Accelerometer_Jerk_Magnitude...
###########################################################################
if (restart_step <= 2)  { 
  colnames(allsubject)[1] <- "Subject"              
  colnames(allactivity)[1] <- "Activity"   
  
  attach(allactivity)                               ## replace the codes with activity descriptions
    allactivity$Activity[Activity==1]<-"WALKING"
    allactivity$Activity[Activity==2]<-"WALKING_UPSTAIRS"
    allactivity$Activity[Activity==3]<-"WALKING_DOWNSTAIRS"
    allactivity$Activity[Activity==4]<-"SITTING"
    allactivity$Activity[Activity==5]<-"STANDING"
    allactivity$Activity[Activity==6]<-"LAYING"
  detach(allactivity)
  
  features_names<-as.character(file_features$V2)   ## add the column names from features file to the data, these names
  a<-gsub("BodyBody", "Body", features_names,fixed=TRUE) 
  b<-gsub("Mag","_Magnitude",a,fixed=TRUE)
  c<-gsub("fBody","Frequency_Body",b,fixed=TRUE)
  d<-gsub("tBody","Time_Body",c,fixed=TRUE)
  e<-gsub("tGravity","Time_Gravity",d,fixed=TRUE)
  f<-gsub("Gyro","_Gyroscope",e,fixed=TRUE)
  g<-gsub("Jerk","_Jerk",f,fixed=TRUE)
  features_newnames<-gsub("Acc","_Accelerometer",g,fixed=TRUE)
  rm("a");rm("b");rm("c");rm("d");rm("e");rm("f");rm("g")  # clean up working vars
    
  colnames(alldata) <-features_newnames               ## will be replaced after the mean and std columns are extracted
  
  print("Step2 complete")
}
###########################################################################
# STEP 3. Extract the Mean and Std columns into their own datasets 
###########################################################################
if (restart_step <= 3)  {
  meandata<-alldata[,grepl("mean()", colnames(alldata),fixed=TRUE)]
  stddata <-alldata[,grepl("std()" , colnames(alldata),fixed=TRUE)]
  allmeanstd<-cbind(meandata,stddata) 
  
  print("Step3 complete")
}
############################################################################
# STEP 4. Put datasets together into a large table and alter column haedings
############################################################################
if (restart_step <= 4)  { 
   Tidy_Dataset1<-cbind(allsubject,allactivity,allmeanstd) 
   colnames(Tidy_Dataset1) [1] <- "Participant_Number"
   colnames(Tidy_Dataset1) [2] <- "Activity_Recorded"
   
print("Step4 complete")
}
###########################################################################
# STEP 5. Extract a tidy dataset
###########################################################################
if (restart_step <= 5)  { 
  
  z<-gather(Tidy_Dataset1,Participant_Number,Activity_Recorded) 
  zby <- group_by(z,Participant_Number,Activity_Recorded,variable) 
  zsummarise<-summarise_each(zby,funs(mean),value)

  Tidy_Dataset2<-zsummarise
    colnames(Tidy_Dataset2) [3] <- "Movement_Recorded"
    colnames(Tidy_Dataset2) [4] <- "Average_of_Recorded_Movement"
  
  print("Step5 complete")
}
###########################################################################
# STEP 6. Write the tidy dataset to a space separated file
###########################################################################
if (restart_step <= 6)  {
  write.table(Tidy_Dataset2,file="Tidy2.txt",row.name=FALSE)
}
###########################################################################
# STEP 999. Remove the interim work files from the Global Environment 
###########################################################################
if (restart_step <= 999)  {
  rm("z");rm("zby");rm("zsummarise")
  rm("file_xtrain");rm("file_ytrain");rm("file_strain")
  rm("file_xtest"); rm("file_ytest") ;rm("file_stest")      
  rm("file_features");rm("file_activities")
  rm("features_names");rm("features_newnames")
  rm("allactivity");rm("alldata");rm("allmeanstd");rm("allsubject")
  rm("meandata");rm("stddata")
  rm("currentdirectory_flag");rm("Packages_flag");rm("Library_flag");  
  rm("download_flag");rm("readinfiles_flag");rm("restart_step")
  print("Cleanup Complete")
}