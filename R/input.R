#'@title Input of 5 points
#'
#'@description `get_matrix_input` takes 5 points as input and returns a matrix(2 row 5 col)
#'
#'@return A 2x5 matrix with the coordinates of the 5 points
#'@keywords input matrix points
#'@export
#'
get_matrix_input <- function(){
  points <- data.frame(
    p1 = c(0,0),
    p2 = c(0,0),
    p3 = c(0,0),
    p4 = c(0,0),
    p5 = c(0,0)
  )
  print(points)
  for( i in 1:5){
    print(paste("Enter (x,y) coordinates for point", i,":", sep = " "));
    points[,i] <- scan(n=2)
  }
  data.matrix(points)

}
