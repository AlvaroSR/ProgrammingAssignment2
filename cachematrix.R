## These pair of functions calculate the inverse of a matrix and cache the
## inverse matrix for future requirements. 

## This file corresponds to Programming Assignment 2: Lexical Scoping of R
## programing course.

## Álvaro Sánchez 01/17/2015



## This fuction returs a list of functions to:
## 1. Set the matrix to compute the inverse
## 2. Get the matrix 
## 3. Set the inverse of the matrix 
## 4. Get the matrix for future requirements

## input: square invertible matrix

makeCacheMatrix <- function(x = matrix()) {
        cache_inv_matrix<-NULL
        set_matrix<-function(){
                matrixx<<-x
                cache_inv_matrix<<-NULL
        }
        get_matrix<-function(){
                x
        }
        set_inverse<-function(inverse_matrix) {
                cache_inv_matrix<<-inverse_matrix
        }
        get_inverse<-function(){
                cache_inv_matrix
        }
        list(set_matrix=set_matrix, get_matrix=get_matrix, 
             set_inverse=set_inverse, get_inverse=get_inverse)

}


## This fuction returs the inverse of matrix fixed by means of makeCacheMatrix,
## set the inverse for future requirements and get the inverse if the inverse
## of matrix has been previously calculated

## input: the output of makeCacheMatrix function

cacheSolve <- function(x, ...) {  ## Return a matrix that is the inverse of 'x'
        cache_inv_matrix<-x$get_inverse()
        if(!is.null(cache_inv_matrix)){
                message("GETTING CACHE DATA")
                return(cache_inv_matrix)
        }
        data<-x$get_matrix()
        cache_inv_matrix<-solve(data)
        x$set_inverse(cache_inv_matrix)
        cache_inv_matrix
}
