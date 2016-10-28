## makeCacheMatrix - function creates a matrix and sets inverse calculation in cache
## cacheSolve - function computes inverse of matrix

## makeCacheMatrix creates a special matrix object and can cache its inverse and returns a list of functions

makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    get <- function(){
       x
    }
    set <- function(newMatrix){
       x <<- newMatrix
       inverseMatrix <<- NULL
    }
    getInverse <- function(){
      inverseMatrix
    }
    setInverse <- function(solvedMatrix){
      inverseMatrix <<- solvedMatrix
    }
    list(get = get, set = set, getInverse = getInverse, setInverse = setInverse)
}

## cacheSolve computes the inverse of the special "matrix" created by makeCacheMatrix

cacheSolve <- function(x, ...) {
   inverseMatrix <- x$getInverse()
  
   if(!is.null(inverseMatrix)){
      message("getting cached Inverse Matrix data...")
      return(inverseMatrix)
   }
   data <- x$get()
      inverseMatrix <- solve(data, ...)
      x$setInverse(inverseMatrix)
 ## Return a matrix that is the inverse of 'x'
   return(inverseMatrix)
}
