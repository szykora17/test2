#import library
library(dplyr)

#import files
data_test<-read.table('X_test.txt')
subject_test<-read.table('subject_test.txt')
move_test<-read.table('y_test.txt')
data_train<-read.table('X_train.txt')
subject_train<-read.table('subject_train.txt')
move_train<-read.table('y_train.txt')
features<-read.table("features.txt")

#add the subject and activity columns to the test and train data sets
data_test$subject<-subject_test
data_test$move<-move_test
data_train$subject<-subject_train
data_train$move<-move_train

#merge the train and test data sets
data<-rbind(data_test,data_train)

#add the name of the new columns to the features data set
features=rbind(features,c('subject',"subject"))
features=rbind(features,c('move',"activity"))

#choose the variables with only the mean and standard deviation values
meanfeatures<-features[grepl("mean",features$V2),]
meanfeatures<-meanfeatures[!(grepl("Freq",meanfeatures$V2)),]
stdfeatures<-features[grepl("std",features$V2),]

#merge the two different data set of mean and std
mean_std=rbind(meanfeatures,stdfeatures)

#add the subject and activity columns to the test and train data sets
mean_std=rbind(mean_std,c('subject',"subject"))
mean_std=rbind(mean_std,c('move',"activity"))

#change the column names of the merge data 
colnames(data)=features$V1

#make a new variable, just with the mean, std, subject and activity variables
datamstd=data[,mean_std$V1]

#rename the data frame
df=datamstd

#rename the activity variables
df <- df %>%
        mutate(move = case_when(
                move == 1 ~ "WALKING",
                move == 2 ~ "WALKING_UPSTAIRS",
                move == 3 ~ "WALKING_DOWNSTAIRS",
                move == 4 ~ "SITTING",
                move == 5 ~ "STANDING",
                move == 6 ~ "LAYING"
        ))

#rename the column names of df
colnames(df)=mean_std$V2

#make a new data frame with the average of the mean and std variables
#grouped by subject and activity
tidy_data <- df %>%
        group_by(subject, activity) %>%  # Group by Subject and Activity
        summarise(across(where(is.numeric), mean, na.rm = TRUE)) %>%  
        ungroup()  # Remove grouping

#change the column names of the new tidy data frame
c=as.character(colnames(tidy_data))
d=character()
for (i in c){
        d=c(d,paste('Average of',i))
}
d[1]="subject"
d[2]="activity"
colnames(tidy_data)=d

#save the tidy dataset
write.table(tidy_data,"tidy_data_SzB.txt", col.names = TRUE, row.names = FALSE)