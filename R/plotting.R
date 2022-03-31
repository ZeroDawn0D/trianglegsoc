#'@title Plot 5 points
#'
#'@description plots the 5 given point on a 2D plane
#'@param A,B,C,D,E Five points each having an (x,y) value.
#'@keywords plot draw plotting point
#'@export
#'
#'@examples plot_points(c(0,0), c(2,9), c(3,5), c(-2,-5), c(-1,3))
#'
plot_points <- function(A,B,C,D,E){
  x_val <- c(A[1],B[1],C[1],D[1],E[1])
  y_val <- c(A[2],B[2],C[2],D[2],E[2])
  graphics::plot(
    x_val,
    y_val,
    xlab = "X Axis",
    ylab = "Y Axis",
    pch = 16)
  for(i in 1:5){
    graphics::text(x_val[i],y_val[i], labels = i, pos = 2)
  }
}

#'@title Plot a line between 2 points
#'
#'@description Plots a red line between points A and B
#'@param A,B Two points each having an (x,y) value.
#'@keywords plot draw plotting line
#'
#'@examples \dontrun{plot_line(c(1,2), c(3,9))}
#'
#'
plot_line <- function(A,B){
  graphics::segments(
    A[1],A[2],
    B[1],B[2],
    col = "red")
}

#'@title Plot a triangle between 3 points
#'
#'@description Plots red lines between points A, B and C
#'@param A,B,C three points each having an (x,y) value.
#'@keywords plot draw plotting line triangle
#'@export
#'
#'@examples \dontrun{plot_triangle(c(0,0), c(1,1), c(-3,5))}
#'
plot_triangle <- function(A,B,C){
  plot_line(A,B)
  plot_line(B,C)
  plot_line(C,A)

}
