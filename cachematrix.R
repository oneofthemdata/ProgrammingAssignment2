## Writing a pair of functions that cache the inverse of a matrix.

## "makeCacheMatrix" creates a special "matrix", which is really a list containing
## a function to set and get the value of the matrix, set and get the value of the
## inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    n <- NULL
    
    # setting a matrix
    setMatrix <- function(matrix){
        m <<- matrix
        n <<-NULL
    }
    #getting the matrix
    getMatrix <- function() m #Returns the matrix
    setInverse <- function(inverse) n <<- inverse # setting the inverse of the matrix
    getInverse <- function() n # "n" returns the inverse value
    
    # returns a list of the functions
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInverse = setInverse, getInverse = getInverse)
}


## Computing the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
    # Returns a matrix that is the inverse of 'x'
    i <- x$getInverse()
    
    # Returns a inverse matrix if it's set
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    
    # Gets the matrix and assign it to data
    data <- x$getMatrix()
    i <- inverse(data)
    x$setMatrix(i)
    i
}
