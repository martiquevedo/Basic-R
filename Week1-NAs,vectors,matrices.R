install.packages("swirl")
library(swirl)

#### WORKING NAs #######

#vector containing 1000 draws from a standard normaldistribution with 
y <- rnorm(1000)
#vector containing 1000 NAs with 
z <- rep(NA, 1000)
#let's select 100 elements at random from these 2000 values (combining y and z)
my_data <- sample(c(y, z), 100)

#is.na() function tells us whether each element of a vector is NA
#where our NAs are located in our data
my_na <- is.na(my_data)

#TRUE == 1, hence
sum(my_na) #tells how many NA in my_data

## NaN, stands for 'not a number' (p,e 0/0 == NaN)


#### SUBSETTING VECTORS ####
#by  placing an 'index vector' in square brackets immediately after the name of the vector.
x[1:10] #a vector of first 10 elements of vector x
## R uses 'one-based indexing' meaning that the first element of a vector is considered element 1

#logical index vectors:
x[is.na(x)] # a vector of all NA elements of vector x (in order)
y <- x[!is.na(x)] # assign all elements of vector x that are not NA to variable y (creating a vector)
y[y > 0] #a vector of elements of vector y that are positive
##Combine subseting with logical operators (&)
x[!is.na(x) & x > 0] #vector with elements of x that are not NA AND positive

#integer index vectors:
x[c(3,5,7)] #vector with elements 3,5 and 7 of vector x
x[0] #doens't make sense but still returns "numeric(0)"
x[3000] #doens't make sense but still returns "[1] NA"
x[c(-2, -10)] # vector with all elements of x EXCEPT for the 2nd and 10 elements
x[-c(2, 10)] #SAME RESULT!

#numeric vector with three named elements
vect <- c(foo = 11, bar = 2, norf = NA)
names(vect) #[1] "foo"  "bar"  "norf"
vect2 <- c(11,2,NA)
names(vect2) <- c("foo", "bar", "norf")
#check that vect and vect2 are the same
identical(vect,vect2) #[1] TRUE

vect["bar"] #vector with second (bar) element of vector vect






#### MATRICES AND DATA FRAMES ##### 
#Store tubular data with rows and colums
#matrices can only contain a single class of data, data frames can consist of many classes of data

my_vector <- 1:20
dim(my_vector) #returns NULL as a vector doesn't have dimensions
length(my_vector) #retunrs 20

dim(my_vector) <- c(4, 5) #assigns the value c(4, 5) to the `dim` attribute of my_vector
attributes(my_vector) #$dim | [1] 4 5
# the first number is the number of rows and the second is the number of columns
# Therefore, we just gave my_vector 4 rows and 5 columns, Now it's a matrix
class(my_vector) #returns [1] "matrix" "array" 
#a matrix is simply an atomic vector with a dimension attribute
matrix(data = c(1:20), nrow = 4, ncol = 5)# creates a create a matrix containing the numbers (1-20) and dimensions (4 rows, 5 columns)

patients <- c("Bill", "Gina", "Kelly", "Sean") #is a character vector

cbind(patients,my_matrix) #adds vector to matrix, BUT makes the resulting matrix a character matrix 
#(because matrices can only contain one class of data!), hence R is implicit coercion-ing the numbers to characters

my_data <- data.frame(patients, my_matrix) #allowed us to store our character vector of names right alongside our matrix
colnames(my_data) #<- either directly a character vector or stored variable




