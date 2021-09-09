#' This is me testing roxygen documentation
euclidean <-
function(a, b){
  stopifnot((a%%1) + (b%%1) == 0) #check if both numers are integers (even if their R type is double!!!)
  if (b == 0){
    return(max(a,-a))
  } else {
    return(euclidean(b, a%%b))
  }
}
