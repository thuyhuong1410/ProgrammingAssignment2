## Set the value of cache matrix and set the inverse null

## This function creates a "special matrix" object that can caches its inverse

makeCacheMatrix <- function(x = matrix()) {
      i <<- NULL
      set <<- function(y) {
          x <<- y
          i <<- NULL
      }
      get <- function() x 
      setInverse <- function(inverse) i <<- inverse
      getInverse <- function()i
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      i <- x$getInverse()
      if(!is.null(i)) {
          message("getting cached data")
          return(i)
      }
      data <- x$get()
      i <- solve(mat,...)
      x$setInverse(i)
      i
}
