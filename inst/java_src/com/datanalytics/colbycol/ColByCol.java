/*******************************************************************************
*
* Purpose:      Read a large file and process it column by column
*
* Created:      20090729
* Author:       Carlos J. Gil Bellosta
*
* License:      GPL v.3
*
* Modifications:
*
*******************************************************************************/

package com.datanalytics.colbycol;

import au.com.bytecode.opencsv.CSVReader;

import java.io.IOException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;

/**
 *
 * @author Carlos J. Gil Bellosta
 */

public class ColByCol {

    private char sep;
    private int    skip;
    private String inFileName;
    private String[] outFileName;

    public ColByCol ( String inFileName, String outFileNames, int skip, String sep ){

        this.inFileName = inFileName;
        outFileName     = outFileNames.split(";");

        this.skip = skip;
        this.sep  = sep.charAt(0);

    }

    public void execute( String workDir ) throws IOException {

        CSVReader reader = new CSVReader( new FileReader( inFileName ), sep );
System.out.println( inFileName );
System.out.println( "sep" + sep + "endsep");
        BufferedWriter[] outFile = new BufferedWriter[ outFileName.length ];

        for( int i = 0; i < outFileName.length; i++){
            outFile[i] = new BufferedWriter( 
                new FileWriter ( new File (workDir, outFileName[i] ) ) );
        }

        String [] nextLine;
        String token;
        int cont = 0;

        while ( (nextLine = reader.readNext() ) != null ) {
            cont++;
            if( cont <= skip )
                continue;

            for( int i = 0; i < nextLine.length; i++ ){
                token = nextLine[i].trim();
                if( token == "" )
                    token = "NA";
                outFile[i].write( token + "\n" );
            }
        }

        reader.close();
        for( int i = 0; i < outFileName.length; i++){
            outFile[i].close();
        }
    }

}
