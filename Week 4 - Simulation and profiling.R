library(swirl)
# Week 4 - Simulation and Profiling

##### SWIRL EXERCISES 1: Looking at data:#####

ls() # list of variables in workspace
class() #overall structure of object
dim() # gives dimensions of object, p.ex number of rows and columns
nrow()
ncol()

object.size() # space occupying in memory
names() # will return character vector of the colnames
colnames(plants)

head() # gives a preview from the top, default is 6 rows
head(plants,10) #change behaviour to 10 rows

tail() # gives a preview from the bottom, default is 6 rows

summary() # how each variable is distributed and how much of the dataset is missing
# provides different output for each variable, depending on its class.

table(plants$Active_Growth_Period) # visualize subset of data

str() # combination of the functions above

#### SWIRL EXERCISES 2: Simulation: #####
 

#GENERATING RANDOM NUMBERS:
sample(1:6, 4, replace = TRUE) # rolling a 6-sided dice, 4 times with replacement
# Sampling with replacement simply means | that each number is "replaced" after it is selected, so that the same number can show up more than once.

# LETTERS is a predefined variable in R containing a vector of all 26 letters of the English alphabet

#prob argument, a vector of probability weights for obtaining the elements of the vector being sampled.

#The following command will produce 100 flips of an unfair coin and assign the result: 
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))

# A binomial random variable represents the number of 'successes' (heads) in a given number of independent 'trials' (coin flips). Therefore, we can
# generate a single random variable that represents the number of heads in 100 flips of our unfair coin using:
rbinom(1, size = 100, prob = 0.7). 
# Note that you only specify the probability of 'success' (heads) and NOT the probability of 'failure' (tails).

#if we want to see all of the 0s and 1s, we can request 100 observations, each of size 1, with success probability of 0.7
flips2 <- rbinom(100, 1, prob = 0.7)
sum(flips2)
#[1] 70

# The standard normal distribution has mean 0 and standard deviation 1
rnorm(10) 
# will generate 10 random numbers from a standard normal distribution.

#Generate 5 random values from a Poisson distribution with mean 10.
rpois(n = 5,lambda =  10)
my_pois <- replicate(100, rpois(5, 10)) #perform this operation 100 times

# replicate generates a matrix with 100 columns with 5 random numbers generated from a Poisson distribution with mean 10.

cm <- colMeans(my_pois)
hist(cm) # displays normally distribution of the matrix




#### SWIRL EXERCISES 3: Base Graphics ####

# Before plotting, it is always a good idea to get a sense of the data. Key R commands for doing so include, dim(), names(), head(), tail() and summary().
