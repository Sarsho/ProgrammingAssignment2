## Put comments here that give an overall description of what your
## functions do

## saving current working directory, and setting it to the directory containing the 
## R stub code provided for the assignment. The final command will reset the 
## working directory to original
owd <- getwd()
setwd(paste(getwd(), "/", directory,"/", sep = ""))
setwd(owd)

makeCacheMatrix <- function(x = matrix()) {
 
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

setwd(owd)
