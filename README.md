Tidy Human Activity Recognition Dataset proprocessing instructions
============
James Powderly 
powderly@fffff.at
based on the work raw dataset of:
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Universit‡ degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws

# Instructions for preprocessing
## Software Dependency
- In this git repo an R script (run_analysis.R) and a dataset (UCI HAR Dataset) are provided.
- You can download and unzip the github repo master zip and keep the directory structure as is
- **You will need to download and install [Hadley Wickham's](http://had.co.nz/) Reshape2 R package.** You can do so using R or RStudio using the following code 
```R
 install.packages("reshape2")
 library("reshape2")
```
## Run the Script
- You will then need to execute run_analysis.R
```R
 run_analysis()
```
- You should run the script in the same folder as the UCI HAR Dataset directory
- If you do not it will automatically download the dataset from the following address and unzip it in your R/RStudio working directory
- You can get the dataset at the following URL: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## What does the script do:

- run_analysis.R is an R script that: 
  1. downloads and unzips (if needed) a dataset of human actitivy as measured by a samsung smartphone 6DOF gyro and accelerometer
  2. takes a directory of sensor training and testing data and their derivative calculations and merges them into a single file 
  3. Converts them into a wide-format data set ordered by "subject" identifier and additionally ordered by "activity" identifier
  4. Improves readibility by using a single variable per column and variable names that folllow R conventions (camelNotation) according to the [Google R stylebook] of best practices (https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)..
  5. Translates a numerical activity key into english language activity descriptions using.notation 
  6. Subset the list of 500+ variables to a subset of variables that includes all standard deviation and mean calculations by grepping "std" and "mean" patterns
  7. writes the tidy data set to a data.table txt file, called tidy.final.txt                              
  8. Additionally gives a use case examples by melting and casting the dataset to provide a mean calculations for each variable by each possible combination of the identifiers "subject" and "activity" 
  9. This mean melt/cast dataset is also written to a data.table txt file, called tidy_avg.txt  

## How does the script work
                                                                  
- check for Dataset root level folder, if found create tidy data set if not there check for dataset zip, and if found then unzip and proceed and if zip not found then download the dataset from the internet, unzip and proceed. The [zipped dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

```R
        if(file.exists("UCI HAR Dataset")){
                print("Dataset already downloaded and unzipped")
        }else if(file.exists("getdata_projectfiles_UCI HAR Dataset.zip")){
                print("Dataset downloaded. Now Unzipping...")
                unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
                print("Completed.")
        }else if(!file.exists("getdata_projectfiles_UCI HAR.zip")){
                print("Downloading and unzipping dataset...")
                download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "getdata_projectfiles_UCI HAR Dataset.zip")
                unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
                print("Completed.")
        }
```
                
- Opens the following data files: 
  + "./UCI HAR Dataset/features.txt"
  + "./UCI HAR Dataset/activity_labels.txt"
  + "./UCI HAR Dataset/train/X_train.txt"
  + "./UCI HAR Dataset/test/X_test.txt"
  + "./UCI HAR Dataset/train/y_train.txt"
  +	"./UCI HAR Dataset/train/subject_train.txt"
  + "./UCI HAR Dataset/test/y_test.txt"
  + "./UCI HAR Dataset/test/subject_test.txt"

```R
		##---OPEN VARIABLE AND ACTIVITY LABELS
        variableNames <- read.table("./UCI HAR Dataset/features.txt")
        activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        ##---OPEN TRAINING DATA
        ## open the train data set of 7352 obs with 561 computed variables 
        ## for ~ 20 subjects across 5 activities
        trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
         
        ##----OPEN TEST DATA
        ## open the train data set of 7352 obs with 561 computed variables 
        ## for ~ 10 subjects across 5 activities
        testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
        
        ## open the subject data sets of 7352 obs with 561 computed variables 
        ## for ~ 10 subjects 
        ## and the activities data set with 7352 obs with 5 types of activities
        ## for both test and training data        

        ##----OPEN TRAINING SUBJECTS AND ACTIVITY LABELS
        trainActivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
        trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        ##----OPEN TESTING SUBJECTS AND ACTIVITY LABELS
        testActivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
        testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
```

- clean variable names, activity labels and prepare to grep variable list to decrease variables from 500+ to only all 75 std and mean variables    
```R     
        ##------------------PRE-PROCESS DATA.TABLES-----------------##
        ## make the variable names variableNames fit naming conventions ie remove all punctuations, 
        ## spaces and leave just ascii alphanumerics
        variableNames[,2]<-gsub("[^[:ascii:]]|[[:punct:]]|[[:space:]]", "", variableNames[,2], perl=TRUE)
        ## and lowercase the activitylabels and replace the '_' with a '.' as per convention
        activityLabels[,2] <- tolower(activityLabels[,2])
        activityLabels[,2] <- gsub("_", ".", activityLabels[,2])
        ## I use grepl to match the pattern "std" and "mean" which is the std pattern to designate
        ## std distro and mean meansurements in the code book
        toMatch <- c("std", "mean")
        stdMeanLevels <- grep(paste(toMatch,collapse="|"), variableNames[,2], ignore.case=TRUE)
        ## adjust for the offset we will create in the labels by adding "activity" and "subject" labels
        stdMeanLevels <- stdMeanLevels+2
 ```
 - merge training data and testing data separately first adding subject and activity identifiers
 ```R       
        ##------------------MERGE TRAIN DATA.TABLES, ACTIVITIES AND SUBJECTS--------------##
        ##preserve the original data.table
        tempTrainData<-trainData
        ## add the cleaned variable names to the training Data.Table as factors
        names(tempTrainData) <- variableNames[,2]
        ## bind the training activities vector to the train data.table and give it a column name
        tempTrainData<-cbind(trainActivities,tempTrainData)
        colnames(tempTrainData)[1] = "activity"
        ## column bind the training subject vector to the train data.table and give it a column name
        tempTrainData<-cbind(trainSubjects,tempTrainData)
        colnames(tempTrainData)[1] = "subjects"
        
        
        ##------------------MERGE TEST DATA.TABLES, ACTIVITIES AND SUBJECTS--------------##
        ##preserve the original data.table
        tempTestData<-testData
        ## add the cleaned variable names to the testing Data.Table as col label
        names(tempTestData) <- variableNames[,2]
        ## bind the testing activities vector to the testing data.table and give it a column name
        tempTestData<-cbind(testActivities,tempTestData)
        colnames(tempTestData)[1] = "activity"
        ## column bind the test subject vector to the test data.table and give it a column name
        tempTestData<-cbind(testSubjects,tempTestData)
        colnames(tempTestData)[1] = "subjects"
```        
- Then merge test and training data tables together into a single table and clean up row.names
```R
        ##------------------MERGE TEST AND TRAIN DATA.TABLES--------------------------##
        tidyMerge <- rbind(tempTrainData, tempTestData)
        tidyMerge <- tidyMerge[order(tidyMerge$subjects, tidyMerge$activity),]
        ## re-order the row.names attribute which gets scrambled in he order call
        obs<-1:10299
        rownames(tidyMerge)<-obs
```
- convert numeric activity labels into dot.notation english language descriptions
```R        
        ##THIS IS DUMB I KNOW THERE IS A VECTORIZED WAY TO DO THIS. TELL ME IF YOU KNOW
        ## loop through the data.table and replace the activity integer with a descriptive label
        for(i in 1:nrow(tidyMerge)){
                for(a in 1:nrow(activityLabels)){
                        if(tidyMerge[i,2] == activityLabels[a,1]){
                                tidyMerge[i,2]<-activityLabels[a,2]
                        }
                }
        }
```
- Subset 500+ variables for only the 75 std and mean calculations that represent each of the major types of variables mag, jerk, body, etc
```R        
        ## --------------THE FINAL CLEANING STEP-------------------##
        ## I am pulling out just the mean and std variables based on a list of "std" and "mean" patterns
        ## I grepped earlier. And then I cbind them with the first and second cols which are the subject and activity
        ## this is the final tidy data set
        finalTidy <- tidyMerge[,stdMeanLevels]
        finalTidy <- cbind(tidyMerge[,1:2], finalTidy)
```
- demonstrate the much improved ease of use and application potential of the dataset using reshape
```R        
        ##-----------------INSTALL RESHAPE2------------------##
        ## so we can melt a long table out of our very wide one
        ##install.packages("reshape2")
        ##library("reshape2")
        
        ##---------------melt the wide-format data.table to a long-format data.table
        ## this allows you to define the identifiers (subject, activities) versus the measurements 
        ## (std and mean measurements) 
        tempSet <- melt(finalTidy, id.vars=c("subjects", "activity"))
        
        ## once you have the identifiers and measurements defined you can cast the data back to a wide-format
        ## using a function as a way to collapse the data. We were asked to take the mean
        meanSet<-dcast(tempSet, ... ~ variable, fun.aggregate = mean)
```
- Write both tidy datasets to the working directory
```R        
        ## write out our tidy data.table for further analysis 
        write.table(finalTidy, "./tidy_final.txt")
        write.table(meanSet, "./tidy_avgs.txt")
```

#Information on the Original DataSet

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.

## The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Notes: 

- Features are normalized and bounded within [-1,1].

- Each feature vector is a row on the text file.

## For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.