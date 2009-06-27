\name{cbc.get.col}
\alias{cbc.get.col}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Reads a single column from the original file into memory }
\description{
  Function \code{\link{cbc.read.table}} reads a file, stores it column by column in disk file and creates a \code{colbycol} object.
  Function \code{\link{cbc.get.col}} queries this object and returns a single column.
}
\usage{
cbc.get.col(data, column)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{ a \code{colbycol} object }
  \item{column}{ a single number of column name indicating the column to be retrieved from disk }
}
\details{
  \code{column} can be either an existing column name from the file (see \code{\link{colnames.colbycol}}) or a number indicating the correlative order of the column within \code{data}.
}
\value{
  The data contained in the indicated \code{column} in the original file.
}
\references{ ~put references to the literature/web site here ~ }
\author{ Carlos J. Gil Bellosta }
%-\note{ }
%-\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
    cbc.data <- cbc.read.table( system.file("data", "cbc.test.data.txt", package = "colbycol"), sep = "\t" )
    ncol( cbc.data )
    colnames( cbc.data )
    col.01 <- cbc.get.col( cbc.data, 1)
    col.02 <- cbc.get.col( cbc.data, "col02" )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
