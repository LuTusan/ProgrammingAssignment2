## makeCacheMatrix Function creates a special matrix object that can cache its inverse

## makeCacheMatrix creates a special matrix object 
## which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## set the value of the inverse


makeCacheMatrix <- function(x = matrix()){
  mat <- NULL
  set <- function(y) {
    x <<- y
    mat <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) mat <<- inverse
  getInverse <- function() mat
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
} 


## cacheSolve function calculates the mean of the special matrix created with the above function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  inversa <- x$getInverse()
  if (!is.null(inversa)) {
    message("getting cached data")
    return(inversa)
  }
  matriz <- x$get()
  inversa <- solve(matriz, ...)
  x$setInverse(inversa)
  inversa
  
  
}
