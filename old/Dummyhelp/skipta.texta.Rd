\name{skipta.texta}
\alias{skipta.texta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
skipta.texta(txt, char = "_", replchar = ".")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{txt}{ ~~Describe \code{txt} here~~ }
  \item{char}{ ~~Describe \code{char} here~~ }
  \item{replchar}{ ~~Describe \code{replchar} here~~ }
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
function(txt, char = "_", replchar = ".")
{
        backsl <- "\\\\"
        tmpfile1 <- tempfile("splusskipt")
        tmpfile2 <- tempfile("splusskipt")
        tmpskipanaskra <- tempfile("splusskipun")
        on.exit(unlink(tmpfile1))
        on.exit(unlink(tmpfile2))
        on.exit(unlink(tmpskipanaskra))
        txt <- paste(txt, collapse = "\\n")
        write(txt, file = tmpfile1)
        skipun <- paste("sed 's/", backsl, char, "/", backsl, replchar, "/g' <",                tmpfile1, ">", tmpfile2, sep = "")
        write(skipun, file = tmpskipanaskra)
        system(paste("chmod u+x", tmpskipanaskra))
        system(tmpskipanaskra)
        txt <- scan(tmpfile2, what = character(), sep = "\\t")
        return(txt)
        print(skipun)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
