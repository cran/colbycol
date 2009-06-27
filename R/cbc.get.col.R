#################################################################
# 
# File:         cbc.get.col.R
# Purpose:      Gets a single column from a colbycol object
#
# Created:      20090509
# Author:       Carlos J. Gil Bellosta
#
# Modifications: 
#
#################################################################

cbc.get.col <- function( data, column ) 
{
    if( class( data ) != "colbycol" )
        stop("An object of class colbycol is required.")

    if( missing( column ) )
        stop("A column name or number is required.")

    if( length( column ) != 1 )
        stop("Only a single column can be extracted at a time.")

    if( is.character( column ) ){
        column <- which( column == colnames( data ) )
        if( length( column ) == 0 )
            stop("Column name cannot be found")
        if( length( column ) != 1 )
            stop("Column name is ambiguous: two or more columns share the share the same name.")
    }

    if( !is.numeric( column ) )
        stop("Invalid column argument")

    cur.dir <- getwd()
    on.exit( setwd( cur.dir ) )

    setwd( data$tmp.dir )
    load ( data$columns[[ column ]]$filename )      # Loads object tmp
    tmp
}
