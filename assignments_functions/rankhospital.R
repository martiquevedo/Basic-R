setwd("C:/Users/queve/Desktop/Coursera/Introduction to R/assignments/Assignment 3")

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data_read <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  possible_outcomes <- c("heart attack", "heart failure","pneumonia") # given by the exercise
  possible_nums <- c('best','worst')
  
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
  
  OPT1 <- "FALSE" # best is default, hence sorting to lowest
  rank_num <- 1 # best is default, show only 1st in ranking
  
  if (is.numeric(num)){
    rank_num <- num
  }  
    
  if(num %in% possible_nums) { ## WOULD LIKE TO IMPLEMENT DISCARD OTHER INPUT BUT NUMERIc
    
    if(num == 'worst'){
        OPT1 <- "TRUE"
      }
      
      
  }
  
  test <- data_subset[order((as.numeric(data_subset[,outcome])), data_subset[,"name"], decreasing = OPT1),] # select lower value in column of interest, display value in column 'name'
  test[rank_num,'name']## Return hospital name in that state with the given rank 30-day death rate
  
}
