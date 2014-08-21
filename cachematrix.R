## Put comments here that give an overall description of what your
## functions do

## The first function, makCacheMatrix creates a special object (a vector?), which is really a list containing a function to

# set the value of the matrix
# get the value of the matrix
# set the value of the inverse of the matrix
# get the value of the inverse of the matrix

# Based on the makeVector example

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x<<-y
		m<<-NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
	

}



# cachesolve calculates the mean of the special "matrix" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation

# Based on the cachemean example
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
