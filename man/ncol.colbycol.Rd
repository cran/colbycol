\name{ncol.colbycol}
\alias{ncol.colbycol}
\alias{ncol.default}
\alias{ncol}
\alias{nrow.colbycol}
\alias{nrow.default}
\alias{summary.colbycol}
\alias{nrow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Returns the number of rows/cols in a colbycol object }
\description{
  This function extends the \code{\link[base]{ncol}} function for regular \code{data.frames}.
}
\usage{
\method{ncol}{colbycol}(x)
\method{nrow}{colbycol}(x)
\method{summary}{colbycol}( object, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a \code{colbycol} object }
  \item{object}{ a \code{colbycol} object }
  \item{...}{ currently unused }
}
%-\details{ }
\value{
  An \code{integer}.
}
%-\references{ }
\author{ Carlos J. Gil Bellosta }
%-\note{ }
\seealso{ \code{\link[base]{ncol}}, \code{\link[base]{nrow}} }
\examples{
    cbc.data <- cbc.read.table( system.file("extdata", 
        "cbc.test.data.txt", package = "colbycol"), sep = "\t" )
    nrow( cbc.data )
    ncol( cbc.data )
    summary( cbc.data )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
