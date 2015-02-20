##BACKGROUND:## Input Data Set Information: (from features_info.txt and readme.txt files in the original experiment)
 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
 Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
 The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
 of the volunteers was selected for generating the training data and 30% the test data.
 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

======================================================================================================================================================
##COURSERA USAGE OF THE ORIGINAL DATA##

Data from this test has been extracted, column names made easier to understand and test/train data combined. 
Two tidy datasets are created,; one long form with data for each observation and the second with the average calculated 
for each of the mean and standard deviation(std) columns extracted.



Variable						Contents					Description
Participant_Number				Value (1 to 30)  			An identifier of the Subject(Participant) who carried out the experiment.

Activity_Recorded				1=WALKING					What the activity was
								2=WALKING_DOWNSTAIRS
								3=WALKING_UPSTAIRS
								4=SITTING
								5=STANDING
								6=LAYING
								
## The follwing original variables have been renamed and no longer contain individual observations 
but now contain the averaged readings for each Participant_Number/Activity_Recorded pair  ##
ORIGINAL OBS NAME					NEW AVERAGED NAME
tBodyAcc-mean()-X		Renamed	to	Time_Body_Accelerometer-mean()-X		
tBodyAcc-mean()-Y		Renamed	to	Time_Body_Accelerometer-mean()-Y		
tBodyAcc-mean()-Z		Renamed	to	Time_Body_Accelerometer-mean()-Z		
tGravityAcc-mean()-X	Renamed	to	Time_Gravity_Accelerometer-mean()-X		
tGravityAcc-mean()-Y	Renamed	to	Time_Gravity_Accelerometer-mean()-Y		
tGravityAcc-mean()-Z	Renamed	to	Time_Gravity_Accelerometer-mean()-Z		
tBodyAccJerk-mean()-X	Renamed	to	Time_Body_Accelerometer_Jerk-mean()-X		
tBodyAccJerk-mean()-Y	Renamed	to	Time_Body_Accelerometer_Jerk-mean()-Y		
tBodyAccJerk-mean()-Z	Renamed	to	Time_Body_Accelerometer_Jerk-mean()-Z		
tBodyGyro-mean()-X		Renamed	to	Time_Body_Gyroscope-mean()-X		
tBodyGyro-mean()-Y		Renamed	to	Time_Body_Gyroscope-mean()-Y		
tBodyGyro-mean()-Z		Renamed	to	Time_Body_Gyroscope-mean()-Z		
tBodyGyroJerk-mean()-X	Renamed	to	Time_Body_Gyroscope_Jerk-mean()-X		
tBodyGyroJerk-mean()-Y	Renamed	to	Time_Body_Gyroscope_Jerk-mean()-Y		
tBodyGyroJerk-mean()-Z	Renamed	to	Time_Body_Gyroscope_Jerk-mean()-Z		
tBodyAccMag-mean()		Renamed	to	Time_Body_Accelerometer_Magnitude-mean()		
tGravityAccMag-mean()	Renamed	to	Time_Gravity_Accelerometer_Magnitude-mean()		
tBodyAccJerkMag-mean()	Renamed	to	Time_Body_Accelerometer_Jerk_Magnitude-mean()		
tBodyGyroMag-mean()		Renamed	to	Time_Body_Gyroscope_Magnitude-mean()		
tBodyGyroJerkMag-mean()	Renamed	to	Time_Body_Gyroscope_Jerk_Magnitude-mean()		
fBodyAcc-mean()-X		Renamed	to	Frequency_Body_Accelerometer-mean()-X		
fBodyAcc-mean()-Y		Renamed	to	Frequency_Body_Accelerometer-mean()-Y		
fBodyAcc-mean()-Z		Renamed	to	Frequency_Body_Accelerometer-mean()-Z		
fBodyAccJerk-mean()-X	Renamed	to	Frequency_Body_Accelerometer_Jerk-mean()-X		
fBodyAccJerk-mean()-Y	Renamed	to	Frequency_Body_Accelerometer_Jerk-mean()-Y		
fBodyAccJerk-mean()-Z	Renamed	to	Frequency_Body_Accelerometer_Jerk-mean()-Z		
fBodyGyro-mean()-X		Renamed	to	Frequency_Body_Gyroscope-mean()-X		
fBodyGyro-mean()-Y		Renamed	to	Frequency_Body_Gyroscope-mean()-Y		
fBodyGyro-mean()-Z		Renamed	to	Frequency_Body_Gyroscope-mean()-Z		
fBodyAccMag-mean()		Renamed	to	Frequency_Body_Accelerometer_Magnitude-mean()		
fBodyAccJerkMag-mean()	Renamed	to	Frequency_Body_Accelerometer_Jerk_Magnitude-mean()		
fBodyGyroMag-mean()		Renamed	to	Frequency_Body_Gyroscope_Magnitude-mean()		
fBodyGyroJerkMag-mean()	Renamed	to	Frequency_Body_Gyroscope_Jerk_Magnitude-mean()		
tBodyAcc-std()-X		Renamed	to	Time_Body_Accelerometer-std()-X		
tBodyAcc-std()-Y		Renamed	to	Time_Body_Accelerometer-std()-Y		
tBodyAcc-std()-Z		Renamed	to	Time_Body_Accelerometer-std()-Z		
tGravityAcc-std()-X		Renamed	to	Time_Gravity_Accelerometer-std()-X		
tGravityAcc-std()-Y		Renamed	to	Time_Gravity_Accelerometer-std()-Y		
tGravityAcc-std()-Z		Renamed	to	Time_Gravity_Accelerometer-std()-Z		
tBodyAccJerk-std()-X	Renamed	to	Time_Body_Accelerometer_Jerk-std()-X		
tBodyAccJerk-std()-Y	Renamed	to	Time_Body_Accelerometer_Jerk-std()-Y		
tBodyAccJerk-std()-Z	Renamed	to	Time_Body_Accelerometer_Jerk-std()-Z		
tBodyGyro-std()-X		Renamed	to	Time_Body_Gyroscope-std()-X		
tBodyGyro-std()-Y		Renamed	to	Time_Body_Gyroscope-std()-Y		
tBodyGyro-std()-Z		Renamed	to	Time_Body_Gyroscope-std()-Z		
tBodyGyroJerk-std()-X	Renamed	to	Time_Body_Gyroscope_Jerk-std()-X		
tBodyGyroJerk-std()-Y	Renamed	to	Time_Body_Gyroscope_Jerk-std()-Y		
tBodyGyroJerk-std()-Z	Renamed	to	Time_Body_Gyroscope_Jerk-std()-Z		
tBodyAccMag-std()		Renamed	to	Time_Body_Accelerometer_Magnitude-std()		
tGravityAccMag-std()	Renamed	to	Time_Gravity_Accelerometer_Magnitude-std()		
tBodyAccJerkMag-std()	Renamed	to	Time_Body_Accelerometer_Jerk_Magnitude-std()		
tBodyGyroMag-std()		Renamed	to	Time_Body_Gyroscope_Magnitude-std()		
tBodyGyroJerkMag-std()	Renamed	to	Time_Body_Gyroscope_Jerk_Magnitude-std()		
fBodyAcc-std()-X		Renamed	to	Frequency_Body_Accelerometer-std()-X		
fBodyAcc-std()-Y		Renamed	to	Frequency_Body_Accelerometer-std()-Y		
fBodyAcc-std()-Z		Renamed	to	Frequency_Body_Accelerometer-std()-Z		
fBodyAccJerk-std()-X	Renamed	to	Frequency_Body_Accelerometer_Jerk-std()-X		
fBodyAccJerk-std()-Y	Renamed	to	Frequency_Body_Accelerometer_Jerk-std()-Y		
fBodyAccJerk-std()-Z	Renamed	to	Frequency_Body_Accelerometer_Jerk-std()-Z		
fBodyGyro-std()-X		Renamed	to	Frequency_Body_Gyroscope-std()-X		
fBodyGyro-std()-Y		Renamed	to	Frequency_Body_Gyroscope-std()-Y		
fBodyGyro-std()-Z		Renamed	to	Frequency_Body_Gyroscope-std()-Z		
fBodyAccMag-std()		Renamed	to	Frequency_Body_Accelerometer_Magnitude-std()		
fBodyAccJerkMag-std()	Renamed	to	Frequency_Body_Accelerometer_Jerk_Magnitude-std()		
fBodyGyroMag-std()		Renamed	to	Frequency_Body_Gyroscope_Magnitude-std()		
fBodyGyroJerkMag-std()	Renamed	to	Frequency_Body_Gyroscope_Jerk_Magnitude-std()		
