---
title: "CodeBook.md"
output: html_document
---
Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.

# run_analysis.R

## file names


- data_path             : parent folder containing data files 
- train_data_file       : training data
- test_data_file        : test data
- train_label_file      : train label data
- test_label_file       : test label data
- features_file         : file containing features name
- activilty_label_file  : file containing activity text labels 
- train_subject_file    : file for subject numbers for training observations
- test_subject_file     : file for subject numbers for test observations

## variables

 - total_data       : contains joined train and test observations
 - total_labels     : contains joined labels for train and test observations
 - total_subjects   : contains joined list of subjects from train and test observations
  - activity_labels : contains tabel mapping between activity code and text label
  - cols            : it keeps the return set from the function "get_feature_cols_means_std"
  - cols_to_keep : stores columns numbers to keep based in the criteria of features that only contains mean and standard deviation observations
  - cols_names: it keeps the column names as returned by the function ""get_feature_cols_means_std". These are used to give descriptive name to each feature
  - total_set   : contains total set of observations combined with activity labels and subject numbers
  - averages : stores the final result grouped by activity and subject with average value of all features for each group.

## transformations
  - total_data with all features is filtered based on the given columns for mean and std values. The number of these columns are provided by function "get_feature_cols_means_std" in utility script.
  - total_labels is return by the utility function as integer values. These values are transformed to text label by doing a lookup of values of total_labels into activity_labels dataframe
  - total_set is prepared by doing column bind of observations, activity labels and subject numbers
  - name of columns in total_set are replaced as provided in cols_names
  - averages is obtained by using dplyr library and chaining the functions groupby and summarize_each
  
# run_analysis_util.R

## join_data

This function does basic checks for file names and data structure before it row binds train and test data. It assumes that first file is training data and second file is test data
    
## get_feature_cols_means_std

it uses the "grep" function to capture all column numbers and column names that contains "mean" or "std" in its description. Once the original feature names are available it uses "gsub" function to replace all special chracters from the text; in this case expecially "()" and "-"
