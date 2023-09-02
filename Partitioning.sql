

USE master
GO

IF DB_ID('PartitioningDB_Test')>0
BEGIN
	ALTER DATABASE PartitioningDB_Test SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE PartitioningDB_Test
END
GO

CREATE DATABASE PartitioningDB_Test
go 
use PartitioningDB_Test
go


SP_HELPFILE


-- CREATE FILE GROUPS
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2019
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2020
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2021
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2022
ALTER DATABASE PartitioningDB_Test ADD FILEGROUP FG2023

-- ADD DITA FILES TO FILE GROUPS
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2019', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2019.ndf') TO FILEGROUP FG2019
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2020', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2020.ndf') TO FILEGROUP FG2020
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2021', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2021.ndf') TO FILEGROUP FG2021
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2022', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2022.ndf') TO FILEGROUP FG2022
ALTER DATABASE PartitioningDB_Test ADD FILE 
	(Name='Data2023', Filename='\\Mac\Home\Documents\CurrentLearning\SampleDatabases\SSIS_Samples\Data2023.ndf') TO FILEGROUP FG2023


SP_HELPFILE


-- ALTER DATABASE PartitioningDB_Test REMOVE FILE Data2002


CREATE PARTITION FUNCTION PF_TEST(Date)
AS RANGE LEFT
FOR VALUES
(
	'2019-12-31', '2020-12-31', '2021-12-31', '2022-12-31'
)
GO

CREATE PARTITION SCHEME PS_TEST
	AS PARTITION PF_TEST TO (FG2019, FG2020, FG2021, FG2022, FG2023)
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

-- Table partitioning
CREATE UNIQUE CLUSTERED INDEX IX_Clustered_Employees
	ON Employees(HireDate, EmployeeID) ON PS_TEST(HireDate)
GO

ALTER TABLE	Employees ADD PRIMARY KEY NONCLUSTERED (EmployeeID) ON [Primary]
GO

INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Jack', 10001, '2019-01-01')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Philip', 10001, '2019-05-12')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('James', 10002, '2020-01-01')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Henry', 10003, '2021-12-31')
INSERT INTO Employees(FullName, CityCode, HireDate) VALUES ('Lucy', 10004, '2022-01-02')

-- Show partition number of records
SELECT
	$PARTITION.PF_TEST(HireDate) AS partitionNu
	,*
FROM Employees


