#' Dijkstra algorithm
#'
#' @description
#' \code{dijkstra} algorithm takes a graph and an initial node and calculates the shortest path from the
#'initial node to every other node in the graph
#'
#' @param graph, data.frame with three variables (v1, v2 and w) that contains the edges of the graph (from
#' v1 to v2) with the weight of the edge (w).
#'
#' @param init_node, numeric scalar.
#'
#'
#'
#' @return shortest path from the
#' initial node to every other node in the graph.
#'
#'
#' @examples
#'
#' dijkstra(graph, 1)
#' dijkstra(graph, 3)
#'

#'
#' @details
#' The algorithm exists in many variants. Dijkstra's original algorithm found
#' the shortest path between two given nodes, but a more common variant fixes
#' a single node as the "source" node and finds shortest paths from the source to
#' all other nodes in the graph, producing a shortest-path tree.
#'
#' @source
#' See more at: \url{https://en.wikipedia.org/wiki/Dijkstras_algorithm}
#'




################################################################################################

dijkstra <- function(graph, init_node)
  
{
  if ((is.data.frame(graph) == "FALSE" ||
       length(graph) != 3)  ||
      (
        (is.numeric(init_node) == "FALSE") ||
        length(init_node) > 1 ||
        init_node %in% graph[[1]] == FALSE ||
        names(graph) != c("v1", "v2", "w")
      ))
  {
    stop("Invalid Parameters")
  }
  
  
  vertex <- unique(sort(graph[[1]]))
  vertex
  
  
  shortest_dist = vector(length = length(vertex))
  previous_vert = vector(length = length(vertex))
  unvisited <- vertex
  visited <- c()
  
  shortest_dist[] <- Inf
  
  shortest_dist[which(init_node == vertex)] = 0
  
  
  while (length(unvisited) != 0)
  {
    if (!is.null(visited))
    {
      if (length(setdiff(vertex, visited)) == 1)
      {
        index <- setdiff(vertex, visited)
      } else if (length(setdiff(vertex, visited)) > 1)
        
      {
        index <-
          which(shortest_dist[] == min(shortest_dist[(setdiff(vertex, visited))]))
      }
      
    } else
    {
      index <- which(shortest_dist[] == min(shortest_dist))
    }
    
    
    
    if (length(index) > 1)
    {
      index = index[1]
    }
    
    
    
    element_min <- vertex[index]
    
    a <- graph[which(graph[1] == element_min), ]
    
    destination_vertex <- a[[2]]
    weight_vertex <- a[[3]]
    
    
    if (!is.null(visited))
    {
      index_use <-
        which(destination_vertex %in% setdiff(destination_vertex, visited))
      
      weight_vertex <- weight_vertex[index_use]
      destination_vertex <- destination_vertex[index_use]
      
    }
    
    
    i = 1
    
    
    for (i in 1:length(destination_vertex))
    {
      if (length(destination_vertex) == 0)
        break
      
      
      
      
      if (shortest_dist[destination_vertex[i]] == Inf)
        
      {
        shortest_dist[destination_vertex[i]] <-
          weight_vertex[i] + shortest_dist[element_min]
        
        previous_vert[destination_vertex[i]] <- element_min
      }
      
      else
      {
        sum_1 <- shortest_dist[destination_vertex[i]]
        sum_2 <- shortest_dist[element_min] +  weight_vertex[i]
        
        if (sum_1 > sum_2)
        {
          shortest_dist[destination_vertex[i]] <- sum_2
          previous_vert[destination_vertex[i]] <- element_min
        }
        else if (sum_1 < sum_2)
        {
        }
      }
      
      i = i + 1
      
    }
    
    unvisited = unvisited[unvisited != element_min]
    visited = append(visited, element_min)
    
  }
  
  return(shortest_dist)
  
}
