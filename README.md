## Programming Assignment 02

This repository contains the required file for the 2nd programming assignment of the Coursera course **R programming**.

It has been forked from [the repository](https://github.com/rdpeng/ProgrammingAssignment2) of Prof. Peng as required in the brief of the assignment.


The file [cachematrix.R](http://github.com/Benlagra/ProgrammingAssignment2/blob/master/cachematrix.R) defines two functions used to cache a given matrix and its inverse. 

* The first function `makeCacheMatrix` creates an extended 'matrix' object which retains the information about the input matrix and its inverse (The latter being NULL if it hasn't been calculated already).

* The second fonction `cacheSolve`, whose argument is the extended object defined by the first function, is a cached version of the function `Solve`. If the cached inverse matrix hasen't been calculated, `cacheSolve` uses `Solve` to calculate it then caches it in the extended 'matrix' format. Otherwise, it just returns the cached inverse matrix with an appropriate message.
  

