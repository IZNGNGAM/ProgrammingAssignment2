## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This first function makes a 'matrix' that contains a list of functions for setting the matrix, getting the matrix
## setting the inverted matrix and getting the inverted matrix.

makeCacheMatrix <- function(x = matrix()) {
    
    inv <- NULL
    set <- function (y){
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x
    setinvert <- function(inverted) inv <<- inverted
    getinvert <- function() inv
    
    list(set = set, get = get, setinvert = setinvert, getinvert = getinvert)
    
}

## This function calculates the invert matrix of the matrix created using the above function
## It will first check for any cached value before the calculation.

cacheSolve <- function(x, ...) {
    
    inv <- x$getinvert()
    if(!is.null(inv)){
        message('getting cached results')
        return(inv)
        
    }
    data <- x$get()
    inverted <- solve(data)
    x$setinvert(inverted)
    inverted
    
        ## Return a matrix that is the inverse of 'x'
}
