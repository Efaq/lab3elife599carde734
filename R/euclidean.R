#' Euclidean algorithm
#'
#' @description
#' \code{euclidean} returns the Greatest Common Divisor (GCD) of the two inputs of the function
#'
#' @param a,b Integer numbers
#'
#' @return the Greatest Common Divisor (GCD) of the two parameters,
#' or throws an error if not all inputs are integers.
#'
#'
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
#' euclidean(-100, 1000)
#'
#' @details
#' The Euclidean algorithm finds the Greatest Common Divisor (GCD) of two integers.
#' euclidean(a, b) implements a recursive version of the algorithm.
#' The arguments a and b must be integers, otherwise an error will occur.
#' Note that the function works even with negative arguments.
#' @source
#' See more at: \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#'
euclidean = function(a, b) {
  stopifnot((a %% 1) + (b %% 1) == 0) #check if both numbers are integers (even if their R type is double!!!)
  if (b == 0) {
    return(max(a,-a))
  } else {
    return(euclidean(b, a %% b))
  }
}
