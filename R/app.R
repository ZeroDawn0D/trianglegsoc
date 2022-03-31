globalVariables("p")


#'@title Delaunay Triangulation on 5 points
#'
#'@description calculates the delaunay triangulation of 5 points
#'
#'@details Plots the standard delaunay triangulation of the 5 points. input takes
#'@details a 2x5 matrix as input, or takes values from the user at runtime by default
#'
#'@param limit The upper limit on the number of triangles to be drawn, defaults to infinite
#'@param input A 2x5 matrix can be supplied, if left blank the user is asked for values at runtime
#'@examples \dontrun{run_DT()}
#'@examples \dontrun{run_DT(limit = 3)}
#'@examples run_DT(input = matrix(c(1,2,3,9,0,5,6,9,4,3), ncol = 5, byrow = FALSE))
#'@examples run_DT(input = matrix(c(5,6,8,2,9,1,7,9,2,4), ncol = 5, byrow = FALSE))
#'
#'@export
#'
#'
run_DT <- function(limit = Inf, input = NULL){
  #source("R/input.R")
  #source("R/plotting.R")
  #source("R/geometry.R")
  if(is.null(input))
    .GlobalEnv$p <- get_matrix_input()
  else
    .GlobalEnv$p <- data.matrix(input)
  print(p);
  plot_points(
    p[,1],
    p[,2],
    p[,3],
    p[,4],
    p[,5])
  i <- 1
  triangles <- 0
  while(i <= 5){
    j <- i+1
    while(j <= 5){
      k <- j+1
      while(k <= 5){
        if(is_triangle_valid(i,j,k) && triangles < limit){
          plot_triangle(
            p[,i],
            p[,j],
            p[,k]
          )
          print("Triangle drawn between points:")
          print(p[,i])
          print(p[,j])
          print(p[,k])
          triangles <- triangles + 1
        }
        k <- k+1
      }
      j<-j+1
    }
    i<-i+1
  }
}




