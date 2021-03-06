\name{lambert}
\alias{lambert}

\title{Lambert projection}

\description{
Lambert projection.
}

\usage{
lambert(lat, lon, lat0, lon0, lat1, scale = "km", old = F)
}

\arguments{
  \item{lat, lon}{Coordinates as latitude and longitude vectors}
  \item{lat0}{First latitude defining of the projection}
  \item{lon0}{Longitude defining the projection}
  \item{lat1}{Second latitude defining the projection}
  \item{scale}{Scale, default "km", redundant ??}
  \item{old}{Old method ?}
}

\value{
List of components:
  \item{lat, lon }{Coordinates in latitude and longitude}
  \item{x, y}{Input coordinates (projected)}
  \item{scale}{Scale}
  \item{projection}{Projection (stated redunantly)}
  \item{lat0, lon0, lat1}{Defining lats and lon}
is returned invisibly.
}

\note{
Needs elaboration, might be merged with docs for other proj-functions.
}

\seealso{
Called by \code{\link{geoarea}}, \code{\link{orthproj}} and \code{\link{Proj}}.
}

\keyword{manip}
