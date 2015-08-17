## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    #setter of the cached matrix
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    #getter of the cached matrix
    get <- function() x
    
    #set the cached version of the inverse of x
    setInverseMatrix <- function(invMatrix) m <<- invMatrix
    
    #get the cached version of the inverse of x
    getInverseMatrix <- function() m
    
    #list of available functions
    list(set = set, 
         get = get, 
         setInverseMatrix = setInverseMatrix, 
         getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverseMatrix()
    if(!is.null(m)) {
        message("getting cached inverse matrix")
    } else {
        data <- x$get()
        m <- solve(data, ...)
        x$setInverseMatrix(m)
    }
    #return the inverse matrix, cached or not.  This is the SINGLE return of the function
    m
}


# makeVector <- function(x = numeric()) {
#     m <- NULL
#     set <- function(y) {
#         x <<- y
#         m <<- NULL
#     }
#     get <- function() x
#     setmean <- function(mean) m <<- mean
#     getmean <- function() m
#     list(set = set, get = get,
#          setmean = setmean,
#          getmean = getmean)
# }
# 
# cachemean <- function(x, ...) {
#     m <- x$getmean()
#     if(!is.null(m)) {
#         message("getting cached data")
#         return(m)
#     }
#     data <- x$get()
#     m <- mean(data, ...)
#     x$setmean(m)
#     m
# }