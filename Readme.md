README: Data Processing Workflow

Overview
This project processes raw sensor data from wearable devices and generates a 
tidy dataset with the average of each measurement for each subject and activity.
The workflow consists of one R scripts that handle data loading, cleaning, 
transformation, and saving the final dataset.

Scripts and Workflow

1. run_analysis.R
Main script that runs the entire analysis.

How to Run the Analysis

Open RStudio or an R terminal.
Run the main script:
source("run_analysis.R")
The final tidy dataset will be saved as tidy_data_SzB.txt.

Output Files
tidy_data_SzB.txt → Final cleaned dataset.
CodeBook.md → Description of all variables.
Readme.md
