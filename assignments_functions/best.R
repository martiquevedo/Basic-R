setwd("C:/Users/queve/Desktop/Coursera/Introduction to R/assignments/Assignment 3")

# The outcomes can be one of "heart attack", "heart failure", or "pneumonia

# Finding the best hospital in a state
best <- function(state,outcome) {
  ## Read outcome data
  data_read <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  possible_outcomes <- c("heart attack", "heart failure","pneumonia") # given by the exercise
  ## Check that state and outcome are valid
   
  if (!(state %in% data_read$State)){
    stop('invalid state')  
  }
  else if(!(outcome %in% possible_outcomes)) {
    stop('invalid outcome') 
  }
  ## Return hospital name in that state with lowest 30-day death rate
  
  data_subset <- data_read[data_read$State == state,c(2,7,11,17,23)] # first subset for STATE and informative columns
  
  colnames(data_subset) <- c('name','state', possible_outcomes) # change columns names for matching 
  
  # data_subset[,outcome] ### address the column of interest
  # !is.na(as.numeric(data_subset[,outcome])) ### which are not NA after numeric conversion
 
  suppressWarnings(data_subset <- data_subset[!is.na(as.numeric(data_subset[,outcome])),]) # filter NA in column of interest
                                                                                           # supressWarnings to avoid NA message
  
  data_subset[which.min(data_subset[,outcome]),'name'] # select lower value in column of interest, display value in column 'name'

 
  
}
