#'@title Circumcenter calculator
#'
#'@description Calculates the circumcenter of the given triangle
#'@param A,B,C Three points of the triangle
#'@return Coordinates of the circumcenter in (x,y) format
#'
#'@examples circumcenter(c(0,0), c(1, 5), c(-3,1))
#'@export
circumcenter <- function(A,B,C){
  Ax <- A[1]
  Ay <- A[2]
  Bx <- B[1]
  By <- B[2]
  Cx <- C[1]
  Cy <- C[2]
  #let the circumcenter be P
  #equation of line: y = mx + k

  #calculate midpoint of AB as D
  Dx <- (Ax+Bx)/2
  Dy <- (Ay+By)/2

  #calculate midpoint of BC as E
  Ex <- (Bx + Cx)/2
  Ey <- (By + Cy)/2

  #calculate slope mAB and its perpendicular mDP
  mAB <- c(By-Ay,Bx-Ax) #(delY,delX)
  mDP <- c(Bx-Ax,Ay-By) #(delY,delX)

  #calculate slope mBC and its perpendicular mEP
  mBC <- c(Cy-By,Cx-Bx)
  mEP <- c(Cx-Bx,By-Cy)

  eq1 <- line(c(Dx,Dy), mDP)
  eq2 <- line(c(Ex,Ey), mEP)

  const <- c(eq1[3], eq2[3])
  #print(const)
  coeff <- c(eq1[1], eq1[2], eq2[1], eq2[2])
  coeff <- matrix(coeff, nrow = 2, ncol = 2, byrow=TRUE)
  #print(coeff)
  ans <- solve(coeff, const)
 # print(ans)
  return(c(ans[1], ans[2]))
}

#'@title Line to linear equation in two variables
#'
#'@description Calculates the necessary coefficients of the linear equation
#'@param point Given point on the line.
#'@param slope Given slope of the line.
#'
#'@return Ax + By = C in the form (A,B,C)
#'
#'@examples line(c(4,5), c(1,1))
#'@export
#'
line <- function(point, slope){
  c <- 0
  if(slope[2]!=0){
    c <- point[2] - point[1]*slope[1]/slope[2]
    A <- -slope[1]
    B <- slope[2]
    C <- slope[2]*c
    return(c(A,B,C))
  }else{
    c <- point[1]
    return(c(1,0,c))
  }

}

#'@title Distance calculator
#'
#'@description Calculate the distance between 2 points
#'@param A,B Two points in (x,y) format
#'
#'@return A single value, the distance between the two points
#'
#'@examples distance(c(0,0), c(3,4))
#'@export
#'
distance <- function(A,B){
  Ax <- A[1]
  Ay <- A[2]
  Bx <- B[1]
  By <- B[2]
  ans <- sqrt( (Ax-Bx)^2  + (Ay-By)^2 )
  return(ans);
}

#'@title Point position checker
#'
#'@description Checks if point D lies in the circumcenter of triangle ABC
#'@param A,B,C Points of the triangle.
#'@param D Point whose position is to be checked.
#'
#'@return Returns TRUE if D lies in the triangle ABC, FALSE otherwise
#'
#'@examples is_point_in_circle(c(0,1), c(-1,-1), c(1,-1), c(0,0))
#'@examples is_point_in_circle(c(0,1), c(-1,-1), c(1,-1), c(5,5))
#'@export
#'
is_point_in_circle <- function(A,B,C,D){
  P <- circumcenter(A,B,C)
  circumradius <- distance(A,P)
  dist_D <- distance(D,P)
  if( dist_D < circumradius){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

#'@title Delauney triangle check
#'
#'@description Checks if the given triangle is a valid Delauney triangle
#'@param a,b,c Index values for the three triangles to check
#'
#'@return returns TRUE if the triangle is a valid Delaunay triangle, FALSE otherwise
#'
#'@examples \dontrun{is_triangle_valid(1,2,3)}
#'@export
#'
#'
is_triangle_valid <- function(a,b,c){
  valid <- TRUE;
  for(i in 1:5){
    if(! (i %in% c(a,b,c))){
      if(is_point_in_circle(
        p[,a],
        p[,b],
        p[,c],
        p[,i]
      )){
        valid <- FALSE
        break
      }
    }
  }
  return(valid)
}
