
## The following function creates an extended 'Matrix' object returned as a 
## list of functions containing the information about the matrix argument xm 
## and its inverse. These functions are:
##
## * set(ym) resets the matrix xm to be inverted to the value ym and its inverse 
##     to NULL.
## * get() returns the cached matrix xm.
## * getInverse() returns the cached inverse matrix or NULL if the former was 
##     not already computed.
## * setInverse(invserse) sets the new value of the inverse matrix.

makeCacheMatrix <- function(xm = matrix()) {
       
       # Default value for the inverse matrix before any computation.
       ixm <- NULL
       
       set <- function(ym) {
                     xm <<- ym
                     ixm <<- NULL           ## Inverse value stored in Extended  
                                            ## Matrix object reset to NULL 
                                            ## whenever the matrix xm is reset.
       }
       
       get <- function() xm                 ## Gets the stored value of xm.
       
       setInverse <- function(inverse) {
                     ixm <<- inverse       ## Sets ixm to inverse
       }
       
       getInverse <- function() ixm        ## Gets the stored value of ixm.
       
       # Retrun a list of these functions.
       list(set = set, get = get, setInverse = setInverse,
            getInverse = getInverse)

}


## The following functions is an extension to the base function Solve. It 
## calculates the inverse of a matrix only if this has not already beeen done 
## earlier. It acts on the extended object defined in the function above and sets 
## the value of the inverse matrix in that object if this was not done 
## before.

cacheSolve <- function(x, ...) {
        
       # Calls the value of the inverse matrix cached in the extended Matrix 
       # object x.
       ix <- x$getInverse()
       
       # If this is different from NULL, the inverse matrix has already been 
       # calculated and we can use its cached value.
       if(!is.null(ix)) {
              message("Inverse already calculated ! \n Getting cached data.")
              return(ix)
       }
       # Otherwise:
       ## Get the matrix to be inverted from the extended Matrix object
       data <- x$get()
       
       ## Calculate its inverse using the base function Solve
       ix <- solve(data)
       
       ## Update the value of the inverse matrix in the extended matrix object.
       x$setInverse(ix)
       
       ## Finally, return the value of the inverse matrix
       ix
}
