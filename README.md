# BI-Foundamentls

Let's begin this section by introducing some essential terms in Business Intelligence.

Data Warehouse:
  - Subject Oriented
  - Integrated
  - Time-variant
  - Non-volatile

Data Warehouse Schemas:
  - Star Schema
  - Snowflake Schema
  - Constellation Schema

![image](https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/3b9398cc-b535-4e48-aa64-cb66830a3167)


OLAP VS OLTP:

Dimension:

  types of dimension:
    - Junk Dimension
    - Degenerate Dimension
    - Role-playing Dimension

Fact:

SCD (Slowly Change Dimension):


ETL (Extract Transform Load):
The process of combining data from multiple sources into a large, central repository called a data warehouse. ETL uses a set of business rules to clean and organize raw data and prepare it for storage, data analytics, and machine learning (ML).


FileGroup and DataFile:
Data Files contain data and objects such as tables, indexes, stored procedures, and views.
Data files can be grouped together in filegroups for allocation and administration purposes.
In sql server we cannot access data files directly. We have to work with file groups.

Index:
  - Clustered Index
  - NonClustered Index


Partitioning:

USE master
GO
IF DB_ID('PartitioningDB_Test')>0
BEGIN
	ALTER DATABASE PartitioningDB_Test SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE PartitioningDB_Test
END
GO

CREATE DATABASE PartitioningDB_Test
GO
USE PartitioningDB_Test
GO

SP_HELPFILE
-- CREATE FILE GROUPS
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2001
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2002
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2003
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2004
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2005

-- ADD DITA FILES TO FILE GROUPS
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2001', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2001.ndf') TO FILEGROUP FG2001
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2002', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2002.ndf') TO FILEGROUP FG2002
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2003', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2003.ndf') TO FILEGROUP FG2003

SP_HELPFILE

-- ALTER DATABASE PartitioningDB_Test REMOVE FILE Data2002


CREATE PARTITION FUNCTION PF_TEST(INT)
AS RANGE RIGHT
FOR VALUES   -- boundary values
(
	20020101, 20030101
)
GO
-- first value of boundary values, is the maximum value of first partition
-- if RANGE RIGHT => first value is the minimum value of second partition

CREATE PARTITION SCHEME PS_TEST
	AS PARTITION PF_TEST TO (FG2001, FG2002, FG2003)
GO



DROP TABLE IF EXISTS Employees
GO
CREATE TABLE Employees
(
	EmployeeID int identity,
	FullName nvarchar(700),
	CityCode tinyint,
	HireDate Date
)
GO


If there is a cluster index before, we have to delete them. Then we should create new partitioned clustered index 

Partition Key must be participated in Partition Index.

A Clustered index is a type of index in which table records are physically reordered to match the index. A Non-Clustered index is a special type of index in which the logical order of the index does not match the physical stored order of the rows on the disk.
If your index is not unique, sql server put a key beside of records to make it unique (so it is better to select a clustered index as unique ourself)

-- Table partitioning
CREATE UNIQUE CLUSTERED INDEX IX_Clustered_Employees
	ON Employees(HireDate, EmployeeID) ON PS_TEST(HireDate)
GO

ALTER TABLE	Employees ADD PRIMARY KEY NONCLUSTERED (EmployeeID) ON [Primary]
GO

INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Jack', 10001, '2000-01-01')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Philip', 10001, '2001-05-12')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('James', 10002, '2002-01-01')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Henry', 10003, '2002-12-31')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Lucy', 10004, '2006-01-02')

-- Show partition number of records
SELECT
	$PARTITION.PF_TEST(HireDate) AS partitionNu
	,*
FROM Employees


COLUMNSTORE INDEX:




