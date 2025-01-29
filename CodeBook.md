1. General Information
Dataset Name: tidy_data.txt
Author: Bence Szikora
Date Created: [2025-01-29]
Description: This dataset contains the average of multiple measurements 
            (mean and standard deviation values) for each subject and activity.

2. Variables
Variable Name   Description     Type    Possible Values
subject         Unique id.      int     1-30
activity        activity        char    walking, walking_upstairs...
Average of tBodyAcc_mean_X Mean body acc in X num  -1 to 1
... other 65 variables related to sensor signals (unit:time(s))

3. Data Processing Steps

Data was loaded from the original dataset.
Extracted only mean and standard deviation measurements.
Replaced activity codes (1-6) with descriptive labels.
Calculated the average for each subject and activity in a new file
Saved the final tidy dataset as tidy_data.txt
