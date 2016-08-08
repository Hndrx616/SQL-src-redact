/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Partitioning Scheme*/
USE SQLEntrys;
GO
ALTER DATABASE checkMatch
ADD FILEGROUP checkMatchnew;
GO
ALTER DATABASE SQLInput
ADD FILEGROUP SQLInputnew;
GO
-- Adds one file for each filegroup.
ALTER DATABASE checkMatch
ADD FILE 
(
    NAME = Id, Name,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\t1dat1.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP checkMatchnew;
ALTER DATABASE SQLInput 
ADD FILE 
(
    NAME = Id, Score,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\t2dat2.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP SQLInputnew;
GO
-- Creates a partition function called myRangePF1 that will partition a table into four partitions
CREATE PARTITION FUNCTION myRangePF1 (int)
    AS RANGE LEFT FOR VALUES (1, 100, 1000) ;
GO
-- Creates a partition scheme called myRangePS1 that applies myRangePF1 to the four filegroups created above
CREATE PARTITION SCHEME myRangePS1
    AS PARTITION myRangePF1
    TO (checkMatchnew, SQLInputnew,) ;
GO
-- Creates a partitioned table called PartitionTable that uses myRangePS1 to partition col1
CREATE TABLE PartitionTable (col1 int PRIMARY KEY, col2 char(10))
    ON myRangePS1 (col1) ;
GO