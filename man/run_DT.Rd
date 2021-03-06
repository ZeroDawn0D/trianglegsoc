% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/app.R
\name{run_DT}
\alias{run_DT}
\title{Delaunay Triangulation on 5 points}
\usage{
run_DT(limit = Inf, input = NULL)
}
\arguments{
\item{limit}{The upper limit on the number of triangles to be drawn, defaults to infinite}

\item{input}{A 2x5 matrix can be supplied, if left blank the user is asked for values at runtime}
}
\description{
calculates the delaunay triangulation of 5 points
}
\details{
Plots the standard delaunay triangulation of the 5 points. input takes

a 2x5 matrix as input, or takes values from the user at runtime by default
}
\examples{
\dontrun{run_DT()}
\dontrun{run_DT(limit = 3)}
run_DT(input = matrix(c(1,2,3,9,0,5,6,9,4,3), ncol = 5, byrow = FALSE))
run_DT(input = matrix(c(5,6,8,2,9,1,7,9,2,4), ncol = 5, byrow = FALSE))

}
