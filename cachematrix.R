## 
##  The code defines two functions used to cache a matrix and its inverse. 
##  The first function creates an extended 'matrix' object which retains the 
##  information about the matrix and its inverse. The second fonctions, whose 
##  argument is the extended object, is a cached version of the function Solve. 
##  It returns the cached or computed value for the inverse matrix.
##  




## This function creates an extended 'Matrix' object in the form of a list of 
##functions which keep the information about the matrix argument x and its inverse. 
## These functions are:
##
## * set(y) resets the matrix x to be inverted to the value y and its inverse to NULL.
## * get() returns the cached matrix x.
## * getinverse() returns the cached inverse matrix or NULL if the former was not 
##     already computed.
## * setinverse(invserse) sets the new value of the inverse matrix.

makeCacheMatrix <- function(xm = matrix()) {
       
       # Default value for the inverse matrix before any computation.
       ixm <- NULL
       
       set <- function(ym) {
                     xm <<- ym
                     ixm <<- NULL        ## Inverse value stored in Extended  
                                         ## Matrix object reset to NULL whenever 
                                         ## the matrix xm is reset.
       }
       get <- function() xm
       setinverse <- function(inverse) ixm <<- inverse
       getinverse <- function() ixm
       list(set = set, get = get,
            setinverse = setinverse,
            getinverse = getinverse)

}


## This functions is an extension to the base function Solve. It calculates 
## the inverse of a matrix only if this has not already beeen done earlier. 
## It acts on the extended object defined in the function above and sets the 
## value of the inverse matrix in that object if this was not done 
## before.

cacheSolve <- function(x, ...) {
        
       # Calls the value of the inverse matrix cached in the extended Matrix 
       # object x.
       ix <- x$getinverse()
       
       # If this is different from NULL, the inverse matrix has already been 
       # calculated and we can use its cached value.
       if(!is.null(ix)) {
              message("Inverse already calculated ! \n Getting cached data")
              return(ix)
       }
       # Otherwise:
       ## Get the matrix to be inverted from the extended Matrix object
       data <- x$get()
       
       ## Calculate its inverse using the base function Solve
       ix <- solve(data)
       
       ## Update the value of the inverse matrix in the extended matrix object.
       x$setinverse(ix)
       
       ## Finally, return the value of the inverse matrix
       ix
}
