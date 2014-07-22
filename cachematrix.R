##Murphy- cachematrix.R
##The following script caches the inverse of a matrix:
 
##makeCacheMatrix creates a special “matrix”= a list w/ a function
##set value of matrix, get value, set value of inverse, get value of inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
      x <<- y
      inverse <<- NULL
    }
    get<-function(){x}
    setmatrix<-function(inv) {inverse<<- inv}

    getmatrix<-function(){inverse}
    list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

##cacheSolve retrieves the inverse from the cache
#solve() is a function to take the inverse of a matrix

cacheSolve <- function(x, ...) {
    inverse<-x$getmatrix()

    if(!is.null(inverse)){
      message("getting cached data")
      return(inverse)
    }
    mydata <-x$get()
    inverse<-solve(mydata)
    x$setmatrix(inverse)
    inverse
}
##test
x=rbind(c(10, 1/4), c(1/10,8))

m = makeCacheMatrix(x)
m$get()
cacheSolve(m)
cacheSolve(m)
