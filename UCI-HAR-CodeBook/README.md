
# Human Activity Recognition Preproccesed Tidy Dataset CodeBook
James Powderly
**based on the original codebook for the UCI HAR Dataset** 
>by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems >Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. >activityrecognition@smartlab.ws www.smartlab.ws

- the Tidy Data set contains:
  + 10299 complete rows of observations
  + 88 variable columns (2 identifiers, 86 measurements
- it is in a wide-format configuration

## Identifier Columns

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

## Variable/Measurement Columns

- "3" "tBodyAccmeanX" - a time domain mean of the body linear acceleration in X cord
- "4" "tBodyAccmeanY" - a time domain mean of the body linear acceleration in y cord
- "5" "tBodyAccmeanZ" - a time domain mean of the body linear acceleration in Z cord
- "6" "tBodyAccstdX" - a time domain std of the body linear acceleration in X cord
- "7" "tBodyAccstdY" - a time domain std of the body linear acceleration in Y cord
- "8" "tBodyAccstdZ" - a time domain std of the body linear acceleration in Z cord
- "9" "tGravityAccmeanX" - a time domain mean of the gravity linear acceleration in X cord
- "10" "tGravityAccmeanY" - a time domain mean of the gravity linear acceleration in Y cord
- "11" "tGravityAccmeanZ" - a time domain mean of the gravity linear acceleration in Z cord
- "12" "tGravityAccstdX" - a time domain std of the gravity linear acceleration in X cord
- "13" "tGravityAccstdY" - a time domain std of the gravity linear acceleration in Y cord
- "14" "tGravityAccstdZ" - a time domain std of the gravity linear acceleration in Z cord
- "15" "tBodyAccJerkmeanX" - a time domain mean of the body jerk acceleration in X cord
- "16" "tBodyAccJerkmeanY" - a time domain  mean of the body jerk acceleration in Y cord
- "17" "tBodyAccJerkmeanZ" - a time domain  mean of the body jerk acceleration in Z cord
- "18" "tBodyAccJerkstdX" - a time domain  std of the body jerk acceleration in X cord
- "19" "tBodyAccJerkstdY" - a time domain  std of the body jerk acceleration in Y cord
- "20" "tBodyAccJerkstdZ" - a time domain  std of the body jerk acceleration in Z cord
- "21" "tBodyGyromeanX" - a time domain mean of the body rotation in X cord
- "22" "tBodyGyromeanY" - a time domain mean of the body  rotation in Y cord
- "23" "tBodyGyromeanZ" - a time domain mean of the body rotation in Z cord
- "24" "tBodyGyrostdX" - a time domain std of the body rotation in X cord
- "25" "tBodyGyrostdY" - a time domain std of the body rotation in Y cord
- "26" "tBodyGyrostdZ" - a time domain std of the body rotation in Z cord
- "27" "tBodyGyroJerkmeanX" - a time domain mean of the body jerk rotation in X cord
- "28" "tBodyGyroJerkmeanY" - a time domain mean of the body jerk rotation in Y cord
- "29" "tBodyGyroJerkmeanZ" - a time domain mean of the body jerk rotation in Z cord
- "30" "tBodyGyroJerkstdX" - a time domain std of the body jerk rotation in X cord
- "31" "tBodyGyroJerkstdY" - a time domain std of the body jerk rotation in Y cord
- "32" "tBodyGyroJerkstdZ" - a time domain std of the body jerk rotation in Z cord
- "33" "tBodyAccMagmean" - a time domain mean of the body acceleration magnitude
- "34" "tBodyAccMagstd" - a time domain std of the body acceleration magnitude
- "35" "tGravityAccMagmean" - a time domain mean of the gravity acceleration magnitude
- "36" "tGravityAccMagstd" - a time domain std of the gravity acceleration magnitude
- "37" "tBodyAccJerkMagmean"- a time domain mean of the body jerk acceleration magnitude
- "38" "tBodyAccJerkMagstd" - a time domain std of the body jerk acceleration magnitude
- "39" "tBodyGyroMagmean" - a time domain mean of the body rotation magnitude
- "40" "tBodyGyroMagstd" - a time domain std of the body rotation magnitude
- "41" "tBodyGyroJerkMagmean" - a time domain mean of the body jerk rotation magnitude
- "42" "tBodyGyroJerkMagstd" - a time domain std of the body jerk rotation magnitude
- "43" "fBodyAccmeanX" - a frequency domain mean of the body linear acceleration in X cord
- "44" "fBodyAccmeanY" - a frequency domain mean of the body linear acceleration in Y cord
- "45" "fBodyAccmeanZ" - a frequency domain mean of the body linear acceleration in Z cord
- "46" "fBodyAccstdX" - a frequency domain std of the body linear acceleration in X cord
- "47" "fBodyAccstdY" - a frequency domain std of the body linear acceleration in Y cord
- "48" "fBodyAccstdZ" - a frequency domain std of the body linear acceleration in Z cord-
- "49" "fBodyAccmeanFreqX" - a frequency domain mean of the body linear acceleration in X Frequency
- "50" "fBodyAccmeanFreqY" - a frequency domain mean of the body linear acceleration in Y Frequency
- "51" "fBodyAccmeanFreqZ" - a frequency domain mean of the body linear acceleration in Z Frequency
- "52" "fBodyAccJerkmeanX" - a frequency domain mean of the body jerk acceleration in Z cord
- "53" "fBodyAccJerkmeanY" - a frequency domain mean of the body jerk acceleration in Z cord
- "54" "fBodyAccJerkmeanZ" - a frequency domain mean of the body jerk acceleration in Z cord
- "55" "fBodyAccJerkstdX" - a frequency domain std of the body jerk acceleration in X cord
- "56" "fBodyAccJerkstdY" - a frequency domain std of the body jerk acceleration in Y cord
- "57" "fBodyAccJerkstdZ" - a frequency domain std of the body jerk acceleration in Z cord
- "58" "fBodyAccJerkmeanFreqX" - a frequency domain mean of the body jerk acceleration in Z Frequency
- "59" "fBodyAccJerkmeanFreqY" - a frequency domain mean of the body jerk acceleration in Z Frequency
- "50" "fBodyAccJerkmeanFreqZ" - a frequency domain mean of the body jerk acceleration in Z Frequency
- "61" "fBodyGyromeanX" -  a frequency domain mean of the body rotation in X cord
- "62" "fBodyGyromeanY" - a frequency domain mean of the body rotation in Y cord
- "63" "fBodyGyromeanZ" - a frequency domain mean of the body rotation in Z cord
- "64" "fBodyGyrostdX" - a frequency domain std of the body rotation in X cord
- "65" "fBodyGyrostdY" - a frequency domain std of the body rotation in Y cord
- "66" "fBodyGyrostdZ" - a frequency domain std of the body rotation in Z cord
- "67" "fBodyGyromeanFreqX" - a frequency domain mean of the body rotation in X frequency
- "68" "fBodyGyromeanFreqY" - a frequency domain mean of the body rotation in Y frequency
- "69" "fBodyGyromeanFreqZ" - a frequency domain mean of the body rotation in Z frequency
- "70" "fBodyAccMagmean" - a frequency domain mean of the body linear acceleration magnitude
- "71" "fBodyAccMagstd" - a frequency domain std of the body linear acceleration magnitude
- "72" "fBodyAccMagmeanFreq" - a frequency domain mean of the body jerk acceleration magnitude frequency
- "73" "fBodyBodyAccJerkMagmean" - a frequency domain mean of the body jerk acceleration magnitude
- "74" "fBodyBodyAccJerkMagstd" - a frequency domain std of the body jerk acceleration magnitude
- "75" "fBodyBodyAccJerkMagmeanFreq" - a frequency domain mean of the body jerk acceleration magnitude frequency
- "76" "fBodyBodyGyroMagmean" -a frequency domain mean of the body rotation magnitude 
- "77" "fBodyBodyGyroMagstd" - a frequency domain std of the body rotation magnitude 
- "78" "fBodyBodyGyroMagmeanFreq" - a frequency domain mean of the body rotation magnitude frequency
- "79" "fBodyBodyGyroJerkMagmean" - a frequency domain mean of the body jerk rotation magnitude
- "80" "fBodyBodyGyroJerkMagstd" -  a frequency domain std of the body jerk rotation magnitude
- "81" "fBodyBodyGyroJerkMagmeanFreq" - a frequency domain mean of the body jerk rotation magnitude frequency
- "82" "angletBodyAccMeangravity" - a frequency domain mean of the body jerk rotation magnitude
- "83" "angletBodyAccJerkMeangravityMean" - the angular vector of the body jerk mean over the mean of gravity
- "84" "angletBodyGyroMeangravityMean" - the angular vector of the body rotation mean over the mean of gravity
- "85" "angletBodyGyroJerkMeangravityMean" - the angular vector of the body jerk rotation mean over the mean of gravity
- "86" "angleXgravityMean" - the mean of the angular vector of gravity in the X coordinate
- "87" "angleYgravityMean" - the mean of the angular vector of gravity in the Y coordinate
- "88" "angleZgravityMean" - the mean of the angular vector of gravity in the Z coordinate

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

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

## Misc Calculations

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: ** 

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

** The complete list of variables of each feature vector is available in 'features.txt'**
