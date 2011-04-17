\name{cbc.read.table}
\alias{cbc.read.table}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Reads a huge text file and creates a colbycol object }
\description{
  \code{cbc.read.table} is able to read a huge text data file well beyond the memory restrictions imposed by \code{\link{read.table}}.
  It reads the file line by line, breaks it into as many physical files as columns, reads them back into R one by one and saves them in efficient, native R data files.
}
\usage{
cbc.read.table(file, filehash.name = tempfile( pattern = "filehash_" ), tmp.dir = tempfile( pattern = "dir" ), 
    just.read = NULL, sample.pct = NULL, sep = "\t", 
    header = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{ file to be loaded }
  \item{filehash.name}{ name of the filehash where data will be stored after being read; it will be created via the tools in package \code{filehash} }
  \item{tmp.dir}{ path to the (empty) directory where temporary files are stored }
  \item{just.read}{ vector of column names, numeric positions, or logical pattern for those columns in the file that need to be read; the default value \code{all} loads all columns }
  \item{sample.pct}{ either \code{NULL} (no sampling) or a value (estrictly) between 0 and 1 indicating the proportion of rows to read from \code{file} }
  \item{sep}{ field separator for the data in \code{file} }
  \item{header}{ whether \code{file} contains headers or not }
  \item{\dots}{ other parameters passed to \code{\link{read.table}} internally }
}
\details{
  This function invokes a python script which reads \code{file} line by line, breaks each of them into tokens as indicated by \code{sep}, and stores each column in an independent text file in \code{tmp.dir}.
  These files are then read into R one by one and the text files are replaced by R native data files stored with \code{\link{save}}.
  The function returns a tiny object containing the required metadata, while the data sits in \code{tmp.dir}.

  It is possible both to skip a number of rows passing the \code{skip} parameter to the inner functions. 
  It is also possible to read just a subset of columns by identifying them via the \code{just.read} parameter or to sample a given proportion of the 
  rows in \code{file} providing a number between 0 and 1 via the \code{sample.pct} parameter.
  Note that if after filtering out a subset of rows or columns there are none available, the function fails.

  It is convenient to provide the full path to \code{tmp.dir} in case the working directory is modified; otherwise, the temporary files could not be found.
  If no temporary directory is provided, a temporal one is created that will be erased as the R session ends.

  Caution is required to pass extra arguments to the internal calls to \code{\link{read.table}} via \code{\dots}.
}
\value{
  An object of class \code{colbycol} containing the metadata required to access the data from the original file that is stored in \code{tmp.dir}.
}
%-\references{ None }
\author{ Carlos J. Gil Bellosta }
%- \note{ }
\seealso{ \code{\link{read.table}}, \code{\link{save}} }
\examples{
    cbc.data <- cbc.read.table( system.file("extdata", "cbc.test.data.txt", 
            package = "colbycol"), sep = "\t" )
    nrow( cbc.data )
    colnames( cbc.data )
    col.01 <- cbc.get.col( cbc.data, 1)
    col.02 <- cbc.get.col( cbc.data, "col02" )

    cbc.data.sampled <- cbc.read.table( system.file("extdata", 
            "cbc.test.data.txt", package = "colbycol"), 
            sample.pct = 0.4, sep = "\t" )
    cbc.data.2.cols  <- cbc.read.table( system.file("extdata", 
            "cbc.test.data.txt", package = "colbycol"), 
            just.read = c( 1, 3), sep = "\t" )
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
