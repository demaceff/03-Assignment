# Getting-and-Cleaning-Data-Project
Coursera Assignment from Course 03 Getting and Cleaning Data 
==================================================================
Getting and Cleaning Data
Coursera Project for David McFarlane 
20 Feb 2015

SECTION 1. BACKGROUND

SECTION 2. WHAT THE run_analysis SCRIPT DOES

SECTION 3. HOW THE run_analysis SCRIPT DOES WHAT IT DOES

****************************************************************************************************************
SECTION 1. BACKGROUND

Based on data gathered from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Initial Experiment Explanation:
 One of the most exciting areas in all of data science right now is wearable computing  
 Companies like Fitbit, Nike, and Jawbone Up are racing to develop 
 the most advanced algorithms to attract new users. The data linked to from the course website 
 represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full 
 description is available at the site where the data was obtained

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was 
separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables 
from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
For more information about this dataset contact: activityrecognition@smartlab.ws

Input files from the original experiment:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

*****************************************************************************************************************
#SECTION 2. WHAT THE run_analysis SCRIPT DOES

 Coursea Project
 The purpose of this project is to demonstrate your ability to collect, work with, and clean
 a  data set. The goal is to prepare tidy data that can be used for later analysis. This will
 be graded by peers on a series of yes/no questions related to the project. 

 Project Requirements: 
 - 1) A tidy data set, 
 - 2) A link to a Github repository with the script for performing the analysis, and 
 - 3) A code book that describes the variables, the data, and any transformations or 
    work that you performed to clean up the data called CodeBook.md. 
    You should also include a README.md in the repo with the scripts. (this file)
    This repo explains how all of the scripts work and how they are connected.  

 This R Script is run_analysis.R and does the following. 

 - 1.	Merges the training and the test sets to create one data set.
 - 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
 - 3.	Uses descriptive activity names to name the activities in the data set
 - 4.	Appropriately labels the data set with descriptive variable names. 
 - 5.	From the data set in step 4, creates a second, independent tidy data set with the average 
     of each variable for each activity and each subject.
	 
Assumtions/Expected Results:

1.	The long form has been adopted for the initial tidy Dataset giving 10299 obs of 68 variables

2.	68 columns have been selected from the original data based on interpreting the requirements of "mean()" and "std()"

3.	Tidy Dataset 2 has 11880 obs of 4 variables:
			Participant_Number
			Activity_Recorded
			Movement_Recorded
			Average_of_Recorded_Movement

******************************************************************************************************************
#SECTION 3. SCRIPT Detail	 
  Based on the value set in the Runtime Flags set up the environment and input
  
  Set flag to setwd to the Assignment directory
  
  Set flag if the Packages required for this script are not in the Users' Environment
  
  Set flag if libraries have not been pulled into the current environment
  
  Set flag if download and unzip required
  
  Set flag if the files need to be read into R Global Environment
  
  Restart Value denotes where to start in the script 
    (a value of 999 means run nothing a value of 2 means start at step2 and run all subsequent steps

  STEP 0. Set up the environment:
  
  STEP 0a. Set working directory, (only if 'currentdirectory_flag' == 1)
  
  STEP 0b. Install Packages, (only if 'Packages_flag' == 1)
  
  STEP 0c. Use libraries,  (only if flag == 1)
  
  STEP 0d. Download file and unzip it into the Project directory (only if flag == 1)
  
  STEP 0e. Read file into global environment (only if flag == 1)

  STEP 1. Combine all rows for each file type - Activity, Subject and Data
  
  STEP 2. Replace
  
      a.    Column names V1...Vnnnn with something more descriptive
	  
      b.    Activity codes in rows with their actual description
	  
      c.    Also replaces columns like tBodyAccJerkMag... with
	  
                                  Average_Time_Body_Accelerometer_Jerk_Magnitude...
								  
  STEP 3. Extract the Mean and Std columns into their own datasets
  
  STEP 4. Put datasets together into a large table and alter column haedings (Tidy Dataset long form)
  
  STEP 5. Extract a second independant tidy dataset with the average of each variable
  
  STEP 6. Write the tidy dataset to a space separated file
  
  STEP 999. Remove (Cleanup) the interim work files from the Global Environment 






















