USE AdventureWorks2012;
GO
IF OBJECT_ID('demoCustomer') IS NOT NULL BEGIN
DROP TABLE demoCustomer;
END;

CREATE TABLE #demoCustomer(CustomerID INT NOT NULL PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL, MiddleName NVARCHAR(50) NULL,
LastName NVARCHAR(50) NOT NULL);



--1
INSERT INTO dbo.demoCustomer (CustomerID, FirstName, MiddleName, LastName)
VALUES (1,'Orlando','N.','Gee');
--2
INSERT INTO dbo.demoCustomer (CustomerID, FirstName, MiddleName, LastName)
SELECT 3, 'Donna','F.','Cameras';
--3
INSERT INTO dbo.demoCustomer
VALUES (4,'Janet','M.','Gates');
--4
INSERT INTO dbo.demoCustomer
SELECT 6,'Rosmarie','J.','Carroll';
--5
INSERT INTO dbo.demoCustomer (CustomerID, FirstName, MiddleName, LastName)
VALUES (2,'Keith',NULL,'Harris');









PRINT '2';
--2

INSERT INTO dbo.demoCustomer (CustomerID, LastName, FirstName)
VALUES (10,'Garza', 'Vignesh');


GO
PRINT '3';
GO
--3
INSERT INTO dbo.demoCustomer
VALUES (11,'Katherine',null,'Harding');
--4
INSERT INTO dbo.demoCustomer (CustomerID, FirstName, MiddleName, LastName)
VALUES (12, 'Katherine', NULL,'Harding');




INSERT INTO dbo.demoCustomer (CustomerID, FirstName, MiddleName, LastName)
--
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE BusinessEntityID BETWEEN 19 AND 35;