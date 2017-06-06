## Put comments here that give an overall description of what your
## functions do

## These functions written in partial fulfillment of Coursera Data Science: R Programming 
## Week 3 Assignment; week beginning June 6, 2017; GitHub user: gourabdasgit

##  This function is able to cache the potentially time-consuming computation,
## inverse of a matrix. If the contents of a matrix are not changing, we can
## cache the value of the inverse matrix so that when we need it again, it
## can be looked up in the cache rather than recomputed.

## The first function, "makeCacheMatrix" creates a special "matrix", which is
## really a list containing a function to

#1.  set the value of the matrix
#2.  get the value of the matrix
#3.  set the value of the inverse matrix
#4.  get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
inv <- NULL                             ## initialize inv as NULL; will hold value of matrix inverse 
set <- function(y) {                    ## define the set function to assign new 
    x <<- y                             ## value of matrix in parent environment
    inv <<- NULL                        ## if there is a new matrix, reset inv to NULL
}
get <- function() x                     ## define the get fucntion - returns value of the matrix argument

setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
getinverse <- function() inv                     ## gets the value of inv where called
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
                                                                              ## to the functions with the $ operator
}


## The following function calculates the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it "gets" the inverse matrix
## from the cache and skips the computation. Otherwise, it calculates the
## inverse of the data and sets the value of the inverse in the cache via
## the "setinverse" function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()
if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinverse(inv)
inv
}

