# create a function that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 

pollutantmean <- function(directory, pollutant, id = 1:332){
  empty_vector <- c() #empty data_storage
  for (x in 1:length(id)) { #loop through ids
      data_read <- read.csv(paste0(directory,sprintf("%03d", id[x]),".csv"),) #ids are in 000 format
      empty_vector <- c(empty_vector, data_read[,pollutant]) #store data in vector
  }
  mean(empty_vector, na.rm = T) #mean of vector
}