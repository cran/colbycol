\name{cbc.save}
\alias{cbc.load}
\alias{cbc.save}

\title{ Save and load colbycol objects saved on disk }
\description{
  These functions save and load colbycol objects, possibly for storage between sessions.
}
\usage{
cbc.save( data )
cbc.load( file.name )
}

\arguments{
  \item{data}{ a \code{colbycol} object }
  \item{file.name}{ path to the \code{filehash} object to be loaded }
}
%-\details{ }
\value{
  Function \code{cbc.load}, if successful, returns an object of class \code{colbycol}.
  Function \code{cbc.save}, for convenience, returns the name of the file where data has been stored.
}
%-\references{ }
\author{ Carlos J. Gil Bellosta }
%-\note{ }
%-\seealso{ \code{\link[base]{ncol}}, \code{\link[base]{nrow}} }
\examples{
    cbc.data <- cbc.read.table( system.file("extdata", 
        "cbc.test.data.txt", package = "colbycol"), sep = "\t" )
    new.cbc.data <- cbc.load( cbc.save( cbc.data ) )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
