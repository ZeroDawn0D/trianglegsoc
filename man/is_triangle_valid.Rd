% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geometry.R
\name{is_triangle_valid}
\alias{is_triangle_valid}
\title{Delauney triangle check}
\usage{
is_triangle_valid(a, b, c)
}
\arguments{
\item{a, b, c}{Index values for the three triangles to check}
}
\value{
returns TRUE if the triangle is a valid Delaunay triangle, FALSE otherwise
}
\description{
Checks if the given triangle is a valid Delauney triangle
}
\examples{
\dontrun{is_triangle_valid(1,2,3)}
}
