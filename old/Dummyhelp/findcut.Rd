\name{findcut}
\alias{findcut}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
findcut(x, xb, in.or.out)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ ~~Describe \code{x} here~~ }
  \item{xb}{ ~~Describe \code{xb} here~~ }
  \item{in.or.out}{ ~~Describe \code{in.or.out} here~~ }
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
  ...
}
\references{ ~put references to the literature/web site here ~ }
\author{ ~~who you are~~ }
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x, xb, in.or.out)
{
	if(!is.data.frame(x))
		x <- data.frame(x = x$x, y = x$y)
	xr <- yr <- mark <- side <- s <- t <- rep(0, (length(x$y) + length(
		xb$y)))
	nxr <- 0
	ab <- ab1 <- rep(0, length(xb$x))
	xr <- .C("define_poly",
		as.double(x$x),
		as.double(x$y),
		as.double(xb$x),
		as.double(xb$y),
		as.double(xr),
		as.double(yr),
		as.integer(length(x$y)),
		as.integer(length(xb$y)),
		as.integer(nxr),
		as.integer(mark),
		as.integer(side),
		as.double(s),
		as.double(t),
		as.double(ab),
		as.double(ab1),
		as.integer(in.or.out))
	nxr <- xr[[9]]
	yr <- xr[[6]][1:nxr]
	mark <- xr[[10]][1:nxr]
	side <- xr[[11]][1:nxr]
	s <- xr[[12]][1:nxr]
	t <- xr[[12]][1:nxr]
	xr <- xr[[5]][1:nxr]
	ind <- c(1:nxr)
	ind2 <- ind[mark == 2]
	i <- geoinside(x[1,  ], reg = xb, option = 3, col.names = c("x", "y"))
	if(in.or.out == 1)
		i <- !i
	if(i == 1 && length(ind2) == 0)
		return(list(x = x$x, y = x$y))
	if(i == 0 && length(ind2) == 0)
		return(invisible())
	if(ind2[1] == 1)
		ind1 <- c(1:nxr)
	else ind1 <- c(ind2[1]:nxr, 1:(ind2[1] - 1))
	xr <- xr[ind1]
	yr <- yr[ind1]
	mark <- mark[ind1]
	side <- side[ind1]
	s <- s[ind1]
	t <- t[ind1]
	h1 <- side + s + 1
	inn <- ifelse(mark == 2, 1, 0)
	ind1 <- ind[mark == 1 | mark == 2]
	nr <- ind[mark == 1 | mark == 2]
	h <- h1[ind1]
	n <- length(h)
	if(n < 2)
		return(invisible())
	# vidbot i profun
	s <- matrix(0, n, 3)
	s[, 2] <- match(sort(h), h)
	s[, 1] <- c(s[n, 2], s[1:(n - 1), 2])
	s[, 3] <- c(s[2:n, 2], s[1, 2])
	o <- match(h, sort(h))
	s <- s[o,  ]
	up <- rep(0, nrow(s))
	pt <- h[s[, 2]] - 0.0001
	i <- geoinside(find.hnit(pt, xb), reg = x, option = 0, col.names = c(
		"x", "y"))
	if(in.or.out == 1) {
		i1 <- c(1:nrow(find.hnit(pt, xb)))
		i <- i1[is.na(match(i1, i))]
	}
	if(length(i) > 0) {
		s[ - i, 1] <- s[ - i, 3]
		up[ - i] <- 1
	}
	s <- matrix(c(s[, 2], s[, 1]),  , 2)
	s1 <- matrix(0, length(h1), 2)
	s1[ind1,  ] <- s
	up1 <- buid <- rep(0, length(h1))
	up1[ind1] <- up
	s1[, 2] <- match(s1[, 2], s1[, 1])
	s1[, 1] <- 1:nrow(s1)
	nxr <- 0
	xr1 <- yr1 <- rep(0, (length(x$x) + length(xb$x)))
	x <- .C("post_filter",
		as.integer(s1[, 2]),
		as.integer(side),
		as.integer(up1),
		as.integer(mark),
		as.double(xr),
		as.double(yr),
		as.integer(buid),
		as.integer(nrow(s1)),
		as.double(xb$x),
		as.double(xb$y),
		as.integer(length(xb$y)),
		as.double(xr1),
		as.double(yr1),
		as.integer(nxr))
	nxr <- x[[14]]
	xr <- x[[12]][1:nxr]
	yr <- x[[13]][1:nxr]
	ind <- c(1:nxr)
	ind <- ind[xr < -999998]
	if(length(ind) > 0)
		xr[ind] <- yr[ind] <- NA
	return(list(x = xr, y = yr, nxr = nxr))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
