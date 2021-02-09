### Coursera Week3 Assignment: Caching the Inverse of a Matrix

# In this assignment we play with the scooping rules of R as one function takes arguments and values defined in the other function.

## First function creates a list of functions applied to a matrix: 
# 1.  set the value of the matrix
# 2.  get the value of the matrix
# 3.  set the value of the inversed matrix
# 4.  get the value of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  # start with empty variable of matrix
  inversedmatrix <- NULL
  
  # input the matrix
  set <- function(y) {
    x <<- y
    # reset variable in case the matrix was changed (see cacheSolve function)
    inversedmatrix <<- NULL
  }
  # just retrieve matrix
  get <- function() x
  
  # 
  setinverse <- function(solve) inversedmatrix <<- solve
  getinverse <- function() inversedmatrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Adapted version to cachemean function provided before:
# Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  
  # look at cache of the input matrix 'x', retrieve its calculated inverse 
  inversedmatrix <- x$getinverse()
  
  # if previously calculated (not NULL), return inverse matrix from cache and inform
  if(!is.null(inversedmatrix)) {
    message("getting cached data - Inversed matrix")
    return(inversedmatrix)
  }
  
  # if the inverse if not there:
  # first retrieve input matrix
  data <- x$get()
  
  # calculate the inverse
  inversedmatrix <- solve(data, ...)
  
  # assign new inverse to cache
  x$setinverse(inversedmatrix)
  
  #return the inverse of the matrix for first time
  inversedmatrix
  
}

# USAGE:# IMPORTANT! cacheSolve needs to take the result from makeCacheMatrix function
# test_matrix <- matrix(c(1,4,9,0,-3,2,2,7,8),3,3)
# m1 <- makeCacheMatrix(test_matrix)
# cacheSolve (m1)


