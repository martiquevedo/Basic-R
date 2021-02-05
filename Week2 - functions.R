

#### FUNCTIONS INTRO #####

#function takes 2 arguments and adds them together
add2 <- function(x,y){
  x+y
}

add2(3,5) #returns 8

#this function takes a vector and returns the a vector with only the number above 10
above10 <- function(x){
  use <- x > 10
  x[use]
}


test_vector <- c(5,12:13,24,3)

above10(test_vector) # returns 12 13 24

#adding a second argument to the function allows to set which the threshold to display numbers
above <- function(x,n){
  use <- x > n
  x[use]
}

above(test_vector,12) # returns 13 24

#you can specify a default number in case no argument is introduced
above <- function(x,n = 10){
  use <- x > n
  x[use]
}

above(test_vector) # returns 12 13 24

# function that calculates the mean of each column of a matrix
columnmean <- function(y){
  nc <- ncol(y) # to know the number of columns
  means <- numeric(nc) #initialize a empty numeric vector that will be filled, length as number of columns
  for (i in 1:nc) { 
    means[i] <- mean(y[,i]) #fill vector mean which each the mean of each column of y
  }
  means #remember to specify what the functions returns
}

columnmean(airquality) # retunrs means of each column BUT if column has NA it doesn't work


#to fix that we can add a second argument to remove NA with default being TRUE
columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y) # to know the number of columns
  means <- numeric(nc) #initialize a empty numeric vector that will be filled, length as number of columns
  for (i in 1:nc) { 
    means[i] <- mean(y[,i], na.rm = removeNA) #now NA are ignored if removeNA is set TRUE (default)
  }
  means #remember to specify what the functions returns
}








#### FUNCTIONS####

# Functions are usually characterized by the name of the function followed by parentheses
# Most functions in R return a value.
# Inputs to functions are often called arguments

args() # displays the arguments of a function
args(lm) #displays function (formula, data, subset, weights, na.action, method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE,  contrasts = NULL, offset, ...) 

# You can set default values for a function's arguments
# matched arguments by name don't require appropriate order
# then arguments are taken by position matching

# FUNCTIONS
#Lazy Evaluation is a common model in a variety of programming languages. And the way that it works is all of the arguments to a function are only evaluated as they're needed.

f <- function (a,b){
  a^2 # no use of b
}
f(2) #returns 4, no error because no b argument introduced

f <- function (a,b){
  print(a^2) # no use of b
  b
}
f(2) #prints 4 and Error in f(2) : argument "b" is missing, with no default

... # are used to extend arguments from original function to another
# also useful when the number of arguments passed to a function cannot be known in advance
# ANY arguments that appear after ... must be named explicitly and full


# you can pass a function as an argument without first defining the passed function
# Functions that are not named are appropriately known as anonymous functions




#### LEXICAL SCROPING #####

#Symbol binding
# First R matches the global environment, later to the search list where there are the different packages and then the base
# Hence order in the packages loading is important and can be configured
# When a package is loaded by "library" the symbols from that environment are put second in list (after global)
# Symbols for functions and vectors can be duplicated (different objects)

# Scoping rules determine how a value is associated with a free variable in a function

f <- function(x,y){
  x^2 +y / z # x and y are formal arguments but z is a free variable (not local variable)
}

# Lexical scoping; the values of free variables are searched for in the enviroment in which the function is defined
# Environment is a collection of symbol and value pairs
# if not found in the current environment, it will look for parent environments until reaching top-level, then if not found there it will continue down the search list
# if not found at the final empty environment then will retunr an error
# AS CONSEQUENCE all objects must be stored in memory

# a function that returns a function for example, the function generated was created in the inside environment of its parent function

# "Constructive functions"
make.power <- function(n){
  pow <- function(x){
    x^n #free variable in function pow but defined in function make.power
  }
  pow
}
# and then even further
cube <- make.power(3) # creates a new function that does x^3
square <- make.power(2)
square(2)

#You can look in the environment in which the function was defined, by
ls(environment(cube)) #returns  "n" "pow"
#using get you can see what value is assigned to arguments for the function, as given by the environment they were created
get("n", environment(cube))

# Dynamic scoping
y <- 10
f <- function(x){
  y <- 2
  y^2 + g(x)
}

g <- function(x){
  x*y
}
f(3)
# with lexical scoping, the value of Y and the function G is looked up in the environment in which the function was defined.
# Which in this case was the global environment. the value of Y and the G function is 10.
# it has the advantage that when calling other functions (for example optimizing functions) to your original funcitons, 
# you don't need to specify arguments are they are evaluated in the environment the original function was created


# with dynamic scoping the value of Y is looked up in the environment from which the function
# was called; sometimes called the calling environment.
# In the R the calling environment is known as is what's called the parent frame. 

# In this case the calling environment Y was defined to be 2 and so the value of Y would be 2.
# Calling the function F would produce different answers depending
# on whether you use lexical scoping or dynamic scoping. 





#### CODING STANDARDS ####

# USE TEXT EDITOR
# INDENT YOUR CODE 
# tab to 8 spaces
# LIMIT YOU CODE TO 80 columns (show margin)
# Split the functions into logical steps, better debugging


#### DATES AND TIME ####
#dates are represented by the date class and, times are represented by two separate
# classes: the POSIXct and the POSIXlt class

x<- as.Date("1970-01-01")
# R actually does calculations based on datesTimes are stored internally as the number of seconds.Since 1970, January 1st

unclass(x) #returns 0 because is the initial date as reference for R
x<- as.Date("1970-01-02") unclass(x) # returns 1

#objects of class POSIXct and POSIXlt

x <- Sys.time() # store current time
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

# CAREFUL sBETWEEN MIXING DATE AND POSIX OBJECTS

#### PRACTICE LOGIC

#There are two logical values in R, also called boolean values. They are TRUE and FALSE
# to negate boolean expressions you can use the NOT operator. An exclamation point `!` will
# cause !TRUE (say: not true) to evaluate to FALSE and !FALSE (say: not false) to evaluate to TRUE.
# for example, you use ! in front of a expression !(5 == 7) #returns TRUE

# & is AND and && only evaluates the firts member of a vector
# | is OR and || only evaluates the firts member of a vector
# All AND operators are evaluated before OR operators.

# function isTRUE() takes one argument. If that argument evaluates to TRUE, the function will
# return TRUE. Otherwise, the function will return FALSE

#function identical() will return TRUE if the two R objects passed to it as arguments are
# identical

# xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this
# function will return TRUE, otherwise it will return FALSE. 

#which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE.

# any() function will return TRUE if one or more of the elements in the logical vector is TRUE. The
# all() function will return TRUE if every element in the logical vector is TRUE.

