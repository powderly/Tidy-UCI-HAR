##---------------------------------------------------------------------------------##
## run_analysis is a script that downloads and unzips (if needed) a set of motion  ##
## sensor data and derivative calculations from a samsung smartphone and:          ##
## 1. merges the test and train data                                               ##
## 2. adds relevantly labelled subject and activity cols                           ##
## 3. adds human-readable words to describe activities                             ##          
## 4. brings variable naming conventions up to standards                           ##
## 5. sorts and orderS by subject ID                                               ##                   
## 6. filters out all variables except std and mean measuremet                     ##
## 7. out puts that tidy data set to a txt data.table                              ##
## 8. uses reshape2's melt and cast to take the mean of each variable by subject   ##
## and activity                                                                    ##
## source by James Powderly                                                        ##
##---------------------------------------------------------------------------------##
run_analysis <- function(){
        
        ## check for Dataset root level folder, if found create tidy data set
        ## if not there check for dataset zip, and if found then unzip and proceed
        ## and if zip not found then download the dataset from the internet, unzip and proceed
        ##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
        
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
                
        ##--------------OPENING DATA.TABLES-----------------------##
        ## open features.txt -- a file with the 561 variable names
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
        
        ##------------------MERGE TEST AND TRAIN DATA.TABLES--------------------------##
        tidyMerge <- rbind(tempTrainData, tempTestData)
        tidyMerge <- tidyMerge[order(tidyMerge$subjects, tidyMerge$activity),]
        ## re-order the row.names attribute which gets scrambled in he order call
        obs<-1:10299
        rownames(tidyMerge)<-obs
        
        ##THIS IS DUMB I KNOW THERE IS A VECTORIZED WAY TO DO THIS. TELL ME IF YOU KNOW
        ## loop through the data.table and replace the activity integer with a descriptive label
        for(i in 1:nrow(tidyMerge)){
                for(a in 1:nrow(activityLabels)){
                        if(tidyMerge[i,2] == activityLabels[a,1]){
                                tidyMerge[i,2]<-activityLabels[a,2]
                        }
                }
        }
        
        ## --------------THE FINAL CLEANING STEP-------------------##
        ## I am pulling out just the mean and std variables based on a list of "std" and "mean" patterns
        ## I grepped earlier. And then I cbind them with the first and second cols which are the subject and activity
        ## this is the final tidy data set
        finalTidy <- tidyMerge[,stdMeanLevels]
        finalTidy <- cbind(tidyMerge[,1:2], finalTidy)
        
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
        
        ## write out our tidy data.table for further analysis 
        write.table(finalTidy, "./tidy_final.txt")
        write.table(meanSet, "./tidy_avgs.txt")
}

