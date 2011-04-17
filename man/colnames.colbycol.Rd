\name{colnames.colbycol}
\alias{colnames.colbycol}
\alias{colnames}
\alias{colnames.default}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Lists the column names in a colbycol object }
\description{
  \code{colnames} lists the column names in a \code{colbycol} object.
  It is an extension of the \code{\link[base]{colnames}} function.
}
\usage{
\method{colnames}{colbycol}(x, do.NULL, prefix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a \code{colbycol} object }
  \item{do.NULL}{ required for the \code{colnames} default function }
  \item{prefix}{ required for the \code{colnames} default function }
}
%\details{ }
\value{
    A character vector containing the names of the columns in \code{x}.
}
%-\references{ ~put references to the literature/web site here ~ }
\author{ Carlos J. Gil Bellosta }
%-\note{ }
\seealso{ \code{\link[base]{colnames}} }
\examples{
    cbc.data <- cbc.read.table( system.file("extdata", 
        "cbc.test.data.txt", package = "colbycol"), sep = "\t" )
    colnames( cbc.data )
}
\keyword{ manip }
