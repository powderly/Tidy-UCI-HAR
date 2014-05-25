
# Human Activity Recognition Preprocessing CodeBook 

## Identifiers

- "1" "subjects" -- There are 30 unique subjects, originally in two datasets (training and testing) but they have been merged herein.
- "2" "activities" -- There are 6 unique activities that represent the six possible states in which a subject can generate data: 
  + 1) walking, 
  + 2) walking.upstairs, 
  + 3) walking.downstairs, 
  + 4) sitting, 
  + 5) standing, 
  + 6)laying

Variable Selection
-------------------

The UCI-HAR-Dataset variables selected for this database originally come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Variable Subset Selection
--------------------------

The subset of the original variables was selected for two reasons:
  + 1) they could be easily obtained using grep on the pattern "std" and "mean" within the original variable names
  + 2) they represent a standard deviation and mean calculation in each representative category: X, Y, Z, gyro, acc, jerk, mag, body, gravity, mad, max,min, sma, energy, igr, entropy, arcoeff, correlation, maxInds, freq, skew, kurtosis, bands and angle

## Variables

"1" "tBodyAccmeanX" - a time domain mean of the body linear acceleration in X cord
"2" "tBodyAccmeanY" - a time domain mean of the body linear acceleration in y cord
"3" "tBodyAccmeanZ" - a time domain mean of the body linear acceleration in Z cord
"4" "tBodyAccstdX" - a time domain std of the body linear acceleration in X cord
"5" "tBodyAccstdY" - a time domain std of the body linear acceleration in Y cord
"6" "tBodyAccstdZ" - a time domain std of the body linear acceleration in Z cord
"7" "tGravityAccmeanX" - a time domain mean of the gravity linear acceleration in X cord
"8" "tGravityAccmeanY" - a time domain mean of the gravity linear acceleration in Y cord
"9" "tGravityAccmeanZ" - a time domain mean of the gravity linear acceleration in Z cord
"10" "tGravityAccstdX" - a time domain std of the gravity linear acceleration in X cord
"11" "tGravityAccstdY" - a time domain std of the gravity linear acceleration in Y cord
"12" "tGravityAccstdZ" - a time domain std of the gravity linear acceleration in Z cord
"13" "tBodyAccJerkmeanX" - a time domain mean of the body jerk acceleration in X cord
"14" "tBodyAccJerkmeanY" - a time domain  mean of the body jerk acceleration in Y cord
"15" "tBodyAccJerkmeanZ" - a time domain  mean of the body jerk acceleration in Z cord
"16" "tBodyAccJerkstdX" - a time domain  std of the body jerk acceleration in X cord
"17" "tBodyAccJerkstdY" - a time domain  std of the body jerk acceleration in Y cord
"18" "tBodyAccJerkstdZ" - a time domain  std of the body jerk acceleration in Z cord
"19" "tBodyGyromeanX" - a time domain mean of the body rotation in X cord
"20" "tBodyGyromeanY" - a time domain mean of the body  rotation in Y cord
"21" "tBodyGyromeanZ" - a time domain mean of the body rotation in Z cord
"22" "tBodyGyrostdX" - a time domain std of the body rotation in X cord
"23" "tBodyGyrostdY" - a time domain std of the body rotation in Y cord
"24" "tBodyGyrostdZ" - a time domain std of the body rotation in Z cord
"25" "tBodyGyroJerkmeanX" - a time domain mean of the body jerk rotation in X cord
"26" "tBodyGyroJerkmeanY" - a time domain mean of the body jerk rotation in Y cord
"27" "tBodyGyroJerkmeanZ" - a time domain mean of the body jerk rotation in Z cord
"28" "tBodyGyroJerkstdX" - a time domain std of the body jerk rotation in X cord
"29" "tBodyGyroJerkstdY" - a time domain std of the body jerk rotation in Y cord
"30" "tBodyGyroJerkstdZ" - a time domain std of the body jerk rotation in Z cord
"31" "tBodyAccMagmean" - a time domain mean of the body acceleration magnitude
"32" "tBodyAccMagstd" - a time domain std of the body acceleration magnitude
"33" "tGravityAccMagmean" - a time domain mean of the gravity acceleration magnitude
"34" "tGravityAccMagstd" - a time domain std of the gravity acceleration magnitude
"35" "tBodyAccJerkMagmean"- a time domain mean of the body jerk acceleration magnitude
"36" "tBodyAccJerkMagstd" - a time domain std of the body jerk acceleration magnitude
"37" "tBodyGyroMagmean" - a time domain mean of the body rotation magnitude
"38" "tBodyGyroMagstd" - a time domain std of the body rotation magnitude
"39" "tBodyGyroJerkMagmean" - a time domain mean of the body jerk rotation magnitude
"40" "tBodyGyroJerkMagstd" - a time domain std of the body jerk rotation magnitude
"41" "fBodyAccmeanX" - a frequency domain mean of the body linear acceleration in X cord
"42" "fBodyAccmeanY" - a frequency domain mean of the body linear acceleration in Y cord
"43" "fBodyAccmeanZ" - a frequency domain mean of the body linear acceleration in Z cord
"44" "fBodyAccstdX" - a frequency domain std of the body linear acceleration in X cord
"45" "fBodyAccstdY" - a frequency domain std of the body linear acceleration in Y cord
"46" "fBodyAccstdZ" - a frequency domain std of the body linear acceleration in Z cord
"47" "fBodyAccmeanFreqX" - a frequency domain mean of the body linear acceleration in X Frequency
"48" "fBodyAccmeanFreqY" - a frequency domain mean of the body linear acceleration in Y Frequency
"49" "fBodyAccmeanFreqZ" - a frequency domain mean of the body linear acceleration in Z Frequency
"50" "fBodyAccJerkmeanX" - a frequency domain mean of the body jerk acceleration in Z cord
"51" "fBodyAccJerkmeanY" - a frequency domain mean of the body jerk acceleration in Z cord
"52" "fBodyAccJerkmeanZ" - a frequency domain mean of the body jerk acceleration in Z cord
"53" "fBodyAccJerkstdX" - a frequency domain std of the body jerk acceleration in X cord
"54" "fBodyAccJerkstdY" - a frequency domain std of the body jerk acceleration in Y cord
"55" "fBodyAccJerkstdZ" - a frequency domain std of the body jerk acceleration in Z cord
"56" "fBodyAccJerkmeanFreqX" - a frequency domain mean of the body jerk acceleration in Z Frequency
"57" "fBodyAccJerkmeanFreqY" - a frequency domain mean of the body jerk acceleration in Z Frequency
"58" "fBodyAccJerkmeanFreqZ" - a frequency domain mean of the body jerk acceleration in Z Frequency
"59" "fBodyGyromeanX" -  a frequency domain mean of the body rotation in X cord
"60" "fBodyGyromeanY" - a frequency domain mean of the body rotation in Y cord
"61" "fBodyGyromeanZ" - a frequency domain mean of the body rotation in Z cord
"62" "fBodyGyrostdX" - a frequency domain std of the body rotation in X cord
"63" "fBodyGyrostdY" - a frequency domain std of the body rotation in Y cord
"64" "fBodyGyrostdZ" - a frequency domain std of the body rotation in Z cord
"65" "fBodyGyromeanFreqX" - a frequency domain mean of the body rotation in X frequency
"66" "fBodyGyromeanFreqY" - a frequency domain mean of the body rotation in Y frequency
"67" "fBodyGyromeanFreqZ" - a frequency domain mean of the body rotation in Z frequency
"68" "fBodyAccMagmean" - a frequency domain mean of the body linear acceleration magnitude
"69" "fBodyAccMagstd" - a frequency domain std of the body linear acceleration magnitude
"70" "fBodyAccMagmeanFreq" - a frequency domain mean of the body jerk acceleration magnitude frequency
"71" "fBodyBodyAccJerkMagmean" - a frequency domain mean of the body jerk acceleration magnitude
"72" "fBodyBodyAccJerkMagstd" - a frequency domain std of the body jerk acceleration magnitude
"73" "fBodyBodyAccJerkMagmeanFreq" - a frequency domain mean of the body jerk acceleration magnitude frequency
"74" "fBodyBodyGyroMagmean" -a frequency domain mean of the body rotation magnitude 
"75" "fBodyBodyGyroMagstd" - a frequency domain std of the body rotation magnitude 
"76" "fBodyBodyGyroMagmeanFreq" - a frequency domain mean of the body rotation magnitude frequency
"77" "fBodyBodyGyroJerkMagmean" - a frequency domain mean of the body jerk rotation magnitude
"78" "fBodyBodyGyroJerkMagstd" -  a frequency domain std of the body jerk rotation magnitude
"79" "fBodyBodyGyroJerkMagmeanFreq" - a frequency domain mean of the body jerk rotation magnitude frequency
"80" "angletBodyAccMeangravity" - a frequency domain mean of the body jerk rotation magnitude
"81" "angletBodyAccJerkMeangravityMean" - the angular vector of the body jerk mean over the mean of gravity
"82" "angletBodyGyroMeangravityMean" - the angular vector of the body rotation mean over the mean of gravity
"83" "angletBodyGyroJerkMeangravityMean" - the angular vector of the body jerk rotation mean over the mean of gravity
"84" "angleXgravityMean" - the mean of the angular vector of gravity in the X coordinate
"85" "angleYgravityMean" - the mean of the angular vector of gravity in the Y coordinate
"86" "angleZgravityMean" - the mean of the angular vector of gravity in the Z coordinate

## Basic Components of Motion

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

## Basic Statistical Estimate Methods

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

## Misc Calculations

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: ** 

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

** The complete list of variables of each feature vector is available in 'features.txt'**
