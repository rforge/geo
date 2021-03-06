\name{findcut}
\alias{findcut}

\title{Find intersection or complement}

\description{
Find intersection or compliment of two polygons.
}

\usage{
findcut(x, xb, in.or.out)
}

\arguments{
  \item{x}{Polygon}
  \item{xb}{Polygon to intersect with/complement from}
  \item{in.or.out}{Whether to take intersect of \code{x} and \code{xb} (0) or complement of \code{x} in \code{xb} (1). Default 0.}
}

\value{
Returns a list of 
  \item{x, y}{Coordinate of intersect or compliment}
  \item{nxr}{Number/index of returned coordinates in \code{xb} (?)}
}

\note{
Needs elaboration.
}

\seealso{
Called by \code{\link{cut_multipoly}}, \code{\link{geointersect}} and \code{\link{reitaplott}}; calls \code{\link{find.hnit}} and \code{\link{geoinside}}.
}

\keyword{manip}
\keyword{logic}
