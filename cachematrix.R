## Coursera: R-Programing, week 3, Assignment 2
## Austin Overman
##
## The following two functions 'makeCacheMatrix', and 'cacheSolve' both take as arguments, 
## THE variable x first as a matrix to MakeCacheMatrix, then a list to cacheSolve and 
## detemine if an inverse to that matrix has previously been calculate and either returns 
## the inverse or calculates the inverse, prints it out and saves it for later use.
##
##
## The makeCahceMatrix function takes 'x' as its only variable which will be corerced to
## to a matrix by default and generates as its output a list of functions that will be 
## used later specifically in the 'cacheSolve' function. The function 'get' within the 
## parent environment makeCahceMatrix is set to the variable 'x' [the matix passed in the 
## function call]. On run, 'setinvrs' is empty because the variable 'invrs'
## has not been defined in the current function environment, but the function 'getinvrs'
## is assigned the value NULL passed through the varibale 'm' which was set to NULL at the
## beginning. Finally a list is returned by the makeChaceMatrix function contining the
## variables as functions that were just created.
##
## Note that the example provided for this assignment included another function 'set' as 
## shown here : set <- function(y) {
##                 x <<- y
##                 m <<- NULL }
##
## but it did not have any value to the operation and output and was never called it 
## has been removed. At worst nothing would have happened to 'x' as 'y' was not defined
## in the 'set' function and 'm' from the the parent environment of the makeCacheMatrix
## is just updated to the same NULL value it previously held.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      get <- function() x
      setinvrs <- function(invrs) m <<- invrs
      getinvrs <- function() m
      list(get = get,
            setinvrs = setinvrs,
            getinvrs = getinvrs)
}


## The cachesolve function takes x as its variable, which is the list that was output from
## makeCacheMatrix function and first determines if the first element of the list 
## 'getinvrs' which was assigned to the local variable 'm' is NULL or not. On first run
## 'getinvrs' is NULL so the if statement is exited and the matrix passed 
## in the list as element 'get' is saved to the local variable 'data' which is then used
## as the object passed to the [base library] 'solve' function and saved as the variable
## 'm' which inturn is passed to the list element 'setinvrs'. Finally the inverse matrix
## is printed out. On second run, assuming no changes to the matrix, the 'getinvrs'
## list function is now not NULL and so the if statement is True so the message "getting
## cached data" is printed out and the function exits returnig the inverse matrix 'm'.

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
