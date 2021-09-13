#' wiki_graph
#'
#' @description
#' \code{wiki_graph} dataset with three variables (v1, v2 and w) 
#' that contains the edges of the graph (from v1 to v2) with the weight of the edge (w).
#' 
#' @format A dataframe with 18 rows and 3 variables
#' 
#'  
#' @source
#' See more at: \url{https://en.wikipedia.org/wiki/Dijkstras_algorithm}
#'

wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))



