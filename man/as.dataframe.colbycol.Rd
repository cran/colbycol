\name{as.data.frame.colbycol}
\alias{as.data.frame.colbycol}
\alias{as.data.frame}
\title{ Creates a data.frame from a colbycol object after possibly filtering either rows or columns }
\description{
  Function \code{\link{as.data.frame}} transforms a colbycol object into a regular data.frame object after possibly filtering out some columns or rows.
}
\usage{
\method{as.data.frame}{colbycol}( x, row.names, optional, ..., rows = NULL, columns = NULL )
}
\arguments{
  \item{x}{ a \code{colbycol} object }
  \item{row.names}{ unimplemented }
  \item{optional}{ unimplemented }
  \item{columns}{ either a character or a numeric vector indicating the selected columns from \code{x} which the data.frame will consist of; the default value \code{NULL} will select them all}
  \item{rows}{ a numeric vector indicating the selected rows from \code{x} which the data.frame will consist of; the default value \code{NULL} will select them all}
  \item{...}{ unimplemented }
}
\details{
    After a colbycol object is created, it is sometimes possible to transform it into a data.frame object stored in RAM. 
    This function can create a data.frame object selecting just a number of rows and columns from the colbycol object.
}
\value{
    A data.frame with the selected columns and rows.
}
\author{ Carlos J. Gil Bellosta }
\examples{
    cbc.data <- cbc.read.table( system.file("extdata", 
        "cbc.test.data.txt", package = "colbycol"), sep = "\t" )

    my.df <- as.data.frame( cbc.data )
    my.df <- as.data.frame( cbc.data, columns = 2:4, rows = 20:60 )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
