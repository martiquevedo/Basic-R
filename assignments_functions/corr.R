# function that takes a directory of data files and a threshold for complete cases and calculates the correlation 
# between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) 
# is greater than the threshold.
# function should return a vector of correlations for the monitors that meet the threshold requirement
# sketch: check nobs by complete, if bigger than threshold then do cor and store in vector, else produce empty vector c() 

corr <- function(directory, threshold = 0){
  #nested a modified complete function to define id and nobs(threshold) and add correlation
  complete <- function(directory, id = 1:332){
    
    results_dataframe <- data.frame(id=integer(),nobs=integer(), correlation = integer()) #empty frame
    
    for (x in 1:length(id)) { #loop through ids
      data_read <- read.csv(paste0(directory,sprintf("%03d", id[x]),".csv"),) #ids are in 000 format
      data_read <- data_read[!is.na(data_read$sulfate)&!is.na(data_read$nitrate),] #select only rows without NAs
      completed_nobs <- data.frame(id=id[x],nobs=nrow(data_read),correlation = cor(data_read$sulfate,data_read$nitrate)) # create data.frame with id and nobs
      # could be integrated directly to the next command but I splited for clarity
      results_dataframe <- rbind(results_dataframe,completed_nobs)# store into final dataframe
      
    }
    
    results_dataframe #return dataframe
    
  }
  
  results_dataframe <- complete(directory) # take the result of complete function outside!
  results_dataframe <- results_dataframe[results_dataframe$nobs>threshold,] # select only ids above nobs threshold
  results_vector <- c() # empty vector in case of no ids
  results_vector <- c(results_dataframe$correlation) # fill vector with correlations
  results_vector # return vector
  
}
