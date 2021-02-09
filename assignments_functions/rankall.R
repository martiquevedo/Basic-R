# The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame
# containing the hospital in each state that has the ranking specified in num.
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data_read <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  possible_outcomes <- c("heart attack", "heart failure","pneumonia") # given by the exercise
  possible_nums <- c('best','worst')
  ## Check that outcome is valid
  if(!(outcome %in% possible_outcomes)) {
    stop('invalid outcome') 
  }
  ## For each state, find the hospital of the given rank
  data_subset <- data_read[,c(2,7,11,17,23)] # first subset for STATE and informative columns
  
  colnames(data_subset) <- c('hospital','state', possible_outcomes) # change columns names for matching 
  
  suppressWarnings(data_subset <- data_subset[!is.na(as.numeric(data_subset[,outcome])),]) # filter NA in column of interest
  # supressWarnings to avoid NA message
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  OPT1 <- "FALSE" # best is default, hence sorting to lowest
  rank_num <- 1 # best is default, show only 1st in ranking
  
  if (is.numeric(num)){
    rank_num <- num
  }  
  #If the number given by num is larger than the number of hospitals in that state, then the function should return NA.
  
  
  if(num %in% possible_nums) { ## WOULD LIKE TO IMPLEMENT DISCARD OTHER INPUT BUT NUMERIc
    
    if(num == 'worst'){
      OPT1 <- "TRUE"
    }
  }
    
  ordered_table <- data_subset[order((as.numeric(data_subset[,outcome])), data_subset[,"hospital"], decreasing = OPT1),]# select lower value in column of interest, display value in column 'name'
  
  results_dataframe <- data.frame(name=character(),state=character()) #empty frame
  
  for (state_var in levels(as.factor(ordered_table$state))){
    
    #make subset with state
    output <- ordered_table[ordered_table$state==state_var,]
    
    results_dataframe <- rbind(results_dataframe,(output[rank_num,c(1,2)]))## fill data_frame with column name and state
    
  }
  #rownames(results_dataframe) <- results_dataframe$state
  results_dataframe 
  
}

