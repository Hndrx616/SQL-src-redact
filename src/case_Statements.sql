/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*CASE statements*/
CASE WHEN bP1 THEN SQLEntry(...)
WHEN (bP2 OR bP3 OR bP4 ) THEN checkSQL(...,
CASE WHEN bP2 THEN NULL
WHEN bP3 THEN FILENAME(...)
WHEN bP4 THEN LOGFILE(...)
END AS FILEGROUP, ... )
WHEN bP5 THEN FILESTREAM(...)