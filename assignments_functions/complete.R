#function that reads a directory full of files and reports the number of completely observed cases in each data file
#first column is the name of the file (named "id") and the second column is the number of complete cases (named "nobs")

complete <- function(directory, id = 1:332){
  
  results_dataframe <- data.frame(id=integer(),nobs=integer()) #empty frame with named columns
  
  for (x in 1:length(id)) { #loop through ids
    
    data_read <- read.csv(paste0(directory,sprintf("%03d", id[x]),".csv"),) #ids are in 000 format
    data_read <- data_read[!is.na(data_read$sulfate)&!is.na(data_read$nitrate),] #select only rows without NAs
    completed_nobs <- data.frame(id=id[x],nobs=nrow(data_read)) # create data.frame with id and nobs
                                                                # could be integrated directly to the next command but I splited for clarity
    results_dataframe <- rbind(results_dataframe,completed_nobs)# store into final dataframe
    
  }
  
  results_dataframe #return dataframe
  
}
