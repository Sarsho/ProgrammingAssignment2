## I need to put some general comments here, or put the below comments here and some
## explicit information below

## This function takes a list of otherwise defined matrix (invertible) and saves it 
## to someplace I need to better understand. I know that the assignment operator
## <<- saves and updates to the symbol/variable in the parent environment.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinvrs <- function(invrs) m <<- invrs
      getinvrs <- function() m
      list(set = set, get = get,
            setinvrs = setinvrs,
            getinvrs = getinvrs)
}


## This function is detemining if the matrix inverse has been calculated by assuming
## that if 'm' is not null and the matrix has not changed that the inverse had been
## calculated and returns the inverse. If 'm' is null then the inverse is calculated
## stored for further use.

cacheSolve <- function(x, ...) {
      m <- x$getinvrs()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinvrs(m)
      m
}
