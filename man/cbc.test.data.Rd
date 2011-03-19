\name{cbc.test.data}
\alias{cbc.test.data}
\title{Simple test data}
\description{
    The testdata dataset is a small dataset to test the \code{colnames} package.
    Its contents are, otherwise, meaningless.
}
\usage{
cbc.test.data
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{col01}{ numeric }
    \item{col02}{ numeric }
    \item{col03}{ numeric }
    \item{col04}{ text }
    \item{col05}{ text }
  }
}
\source{
    Randomly generated.
}

\examples{
    data( cbc.test.data )
    head( cbc.test.data )
}
\keyword{datasets}
