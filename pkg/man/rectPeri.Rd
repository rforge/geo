\name{rectPeri}
\alias{rectPeri}
\alias{rPeri}
\alias{srPeri}
\alias{mrPeri}
\alias{drPeri}

\title{
Given rectangle code return perimeter as a polygon in lat lon
}

\description{

  The outline/boundary of a statistical rectangle is returned as 5
  positions, the first and last of which are the same.

}

\usage{
rPeri(r)
srPeri(sr)
mrPeri(mr, dlat = 5, dlon = 10)
drPeri(dr, dlat = 1, dlon = 2)
}

\arguments{

\item{r, sr, mr, dr}{
  Rectangle codes.
}
\item{dlat, dlon}{
  Dimensions of latitude and longitude given in minutes
  and degrees for \code{mrPeri} and \code{drPeri}, respectively.
}
  
}

\value{Rectangle outline as 5 positions.}

\note{Should perhaps be extended to give a list or dataframe of polygons
  for more than one \code{r, sr, mr} or \code{dr}.}

\seealso{\code{\link{deg2rect}}, \code{\link{rectArea}},
  \code{\link{geoarea}}.}

\examples{
  geoplot(island, type = "n", grid = FALSE)
  geolines(rPeri(468))
  geolines(srPeri(4681))
}


\keyword{arith}
\keyword{manip}

