# This file contains helper functions that helps the main script run_analysis.R
#


join_data = function(folder_path, file1, file2){
# This function reads two files of similar datasets, merge and returns them
    
    if(!file.exists(folder_path)){ return("folder path is invalid")}
    
    fullpath_file1 = file.path(folder_path,file1)
    fullpath_file2 = file.path(folder_path,file2)
    data1 = data2 = NULL
    
    if(!file.exists(fullpath_file1) | !file.exists(fullpath_file2)){
        return("please check the file names")
    }
    
    data1 = read.table(fullpath_file1 )
    data2 = read.table(fullpath_file2)  
    # This is only a basic check on column shape. It does not check the data types
    # . Even it checks, it is hard to verify if they represent same data
    if(length(data1)!=length(data2)){
        return("two datasets have different number of columns")
    }
    rbind(data1,data2)
    
}   


get_feature_cols_means_std = function(folder_path,features_file){
    # This function get the column numbers for al features that has "mean" and "std" values
    
    if(!file.exists(folder_path)){ return("folder path is invalid")}
    
    fullpath_feature_file = file.path(folder_path,features_file)  
    
    if(!file.exists(fullpath_feature_file)){
        return("Check filename of the features file")
    }
    
    features = read.table(fullpath_feature_file)
    
    #get column numbers and names where description has mean or std in it
    col_nums =grep("mean|std",features[,2])
    col_names = grep("mean|std",features[,2],value = TRUE)
    
    # clean names for any special characters
    col_names = gsub("[()-]","",col_names)
    
    list("col_numbers"=col_nums,"col_names"=col_names)
}

get_activity_names = function(folder_path, activity_file){
    # This function get the activity names as text corresponding to each number
    
    if(!file.exists(folder_path)){ return("folder path is invalid")}
    
    fullpath_activity_file = file.path(folder_path,activity_file)  
    
    if(!file.exists(fullpath_activity_file)){
        return("Check filename of the activity file")
    }
    
    activities = read.table(fullpath_activity_file)
    
    activities    
}
