#################################################################
# 
# File:         cbc.read.table
# Purpose:      Read a large file and process it column by column
#
# Created:      20090506
# Author:       Carlos J. Gil Bellosta
#
# Modifications: 
#
#################################################################

cbc.read.table <- function( file, tmp.dir = tempfile( pattern = "dir" ), sep = "\t", header = TRUE, ... )
{

    # Checks parameters for errors

    if( ! file.exists( file ) )
        stop("Missing input file.")

    if( file.exists( file.path( getwd(), file ) ) )         # It was a relative path
        file <- file.path( getwd(), file )

    if( ! file.exists( tmp.dir ) && ! dir.create( tmp.dir, recursive = TRUE )  )
        stop("The destination directory cannot be either found or created.")

    # Sets original and target dirs

    original.dir <- getwd()
    on.exit( setwd( original.dir ) )

    setwd( tmp.dir )

    if( length( dir() > 0 ) )
        stop("The destination directory is not empty.")

    # Sips the data to get metadata info

    tmp.data <- read.table( file, nrows = 50, sep = sep, header = header, ... )

    columns <- sapply( 1:ncol( tmp.data ), function( i ) list( filename = formatC( i, width = 4, flag = "0" )), simplify = FALSE )
    names( columns ) <- colnames( tmp.data )

    if( !exists( "skip", mode = "numeric" ) )
        skip <- 0

    skip <- skip + header

    cat( "filename | ", file, "\n", file = ".delete" )
    cat( "sep      : ", sep, "\n",  file = ".delete", append = TRUE )
    cat( "skip     : ", skip, "\n", file = ".delete", append = TRUE )
    cat( "files    : ", paste( lapply( columns, function(x) x$filename ), collapse = ";" ), "\n", file = ".delete", append = TRUE )

    # From here on, calls to Python via Jython
    # Adapted from G. Grothendieck's sympyStart function from package rSymPy

    if (!exists(".Jython", .GlobalEnv)){

        jython <- Sys.getenv("RSYMPY_JYTHON")
        if (jython == "") jython <- system.file("jython", package = "rSymPy")

        library(rJava)
        .jinit(file.path(jython, "jython.jar"))
        assign(".Jython", .jnew("org.python.util.PythonInterpreter"), .GlobalEnv)
    }
    
    .jcall(.Jython, "V", "exec", paste("work_dir = '", getwd(), "'", sep = "" ))        # Assigns the path in Jython; all required data resides there
    .jcall(.Jython, "V", "execfile", system.file("python", "colbycol.py", package = "colbycol") ) 

    # At this point, the input files should already be sliced

    file.remove( ".delete" )

    for( column in names(columns) ){
        tmp <- read.table( columns[[column]]$filename, sep = sep, na.strings = "", comment.char = "", quote = "", header = FALSE, ... )[,1]
        columns[[column]] <- c( columns[[column]], list( class = class( tmp ) ) )
        save( tmp, file = columns[[column]]$filename )
        nrows <- length( tmp )
        rm( tmp )
        gc()
    }

    tmp <- list( filename = file, tmp.dir = tmp.dir, columns = columns, nrows = nrows )
    class( tmp ) <- "colbycol"
    tmp

}
