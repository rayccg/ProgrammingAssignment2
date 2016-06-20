## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        #set accepts matrix y, replaces the value of x with y, removes value of inv
        set <- function(y = matrix()) {
                x <<- y
                inv <<- NULL
        }
        #get retrieves and prints the latest matrix inside x
        get <- function(){
                
                x
        }
        #setinv accepts a matrix to put as value of inv
        setinv <- function(inverse = matrix()){
                inv <<- inverse
        }
        #getinv retrives and prints the latest value of inv
        getinv <- function(){
                inv
        }
        
        list(set = set, get = get, setinv = setinv, getinv = getinv)

               
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        #gets the stored inv value in x
        inv <- x$getinv()
        #checks if there is already a value stored in inv
        if(!is.null(inv)){
                message("getting cached data")
                #returns already stored inv value
                return(inv)
        #if there is no value in inv yet, calculate inverse using solve      
        } else{
                #retrives latest stored matrix in x
                mymatrix <- x$get()
                #calculates inverse of the matrix and stores it in inv
                inv <- solve(mymatrix)
                #uses setinv to cache calculated inv matrix
                x$setinv(inv)
                #return inv
                inv
        }
}