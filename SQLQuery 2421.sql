--1 First, populate the tempdb tables
USE [tempdb];
GO
CREATE TABLE [Employee](
[EmployeeID] [int] NOT NULL,
[ContactID] [int] NOT NULL,
[ManagerID] [int] NULL,
[Title] [nvarchar](50) NOT NULL);
CREATE TABLE [Contact] (
[ContactID] [int] NOT NULL,
[FirstName] [nvarchar](50) NOT NULL,
[MiddleName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NOT NULL);
INSERT INTO tempdb.dbo.Contact (ContactID, FirstName, MiddleName, LastName) VALUES
(1030,'Kevin','F','Brown'),
(1009,'Thierry','B','DHers'),
(1028,'David','M','Bradley'),
(1070,'JoLynn','M','Dobney'),
(1071,'Ruth','Ann','Ellerbrock'),
(1005,'Gail','A','Erickson'),
(1076,'Barry','K','Johnson'),
(1006,'Jossef','H','Goldberg'),
(1001,'Terri','Lee','Duffy'),
(1072,'Sidney','M','Higa'),
(1067,'Taylor','R','Maxwell'),
(1073,'Jeffrey','L','Ford'),
(1068,'Jo','A','Brown'),
(1074,'Doris','M','Hartwig'),
(1069,'John','T','Campbell'),
(1075,'Diane','R','Glimp'),
(1129,'Steven','T','Selikoff'),
(1231,'Peter','J','Krebs'),

(1172,'Stuart','V','Munson'),
(1173,'Greg','F','Alderson'),
(1113,'David','N','Johnson'),
(1054,'Zheng','W','Mu'),
(1007, 'Ovidiu', 'V', 'Cracium'),
(1052, 'James', 'R', 'Hamilton'),
(1053, 'Andrew', 'R', 'Hill'),
(1056, 'Jack', 'S', 'Richins'),
(1058, 'Michael', 'Sean', 'Ray'),
(1064, 'Lori', 'A', 'Kane'),
(1287, 'Ken', 'J', 'Sanchez');
INSERT INTO tempdb.dbo.Employee (EmployeeID, ContactID, ManagerID, Title) VALUES
(1, 1209, 16,'Production Technician - WC60'),
(2, 1030, 6,'Marketing Assistant'),
(3, 1002, 12,'Engineering Manager'),
(4, 1290, 3,'Senior Tool Designer'),
(5, 1009, 263,'Tool Designer'),
(6, 1028, 109,'Marketing Manager'),
(7, 1070, 21,'Production Supervisor - WC60'),
(8, 1071, 185,'Production Technician - WC10'),
(9, 1005, 3,'Design Engineer'),
(10, 1076, 185,'Production Technician - WC10'),
(11, 1006, 3,'Design Engineer'),
(12, 1001, 109,'Vice President of Engineering'),
(13, 1072, 185,'Production Technician - WC10'),
(14, 1067, 21,'Production Supervisor - WC50'),
(15, 1073, 185,'Production Technician - WC10'),
(16, 1068, 21,'Production Supervisor - WC60'),
(17, 1074, 185,'Production Technician - WC10'),
(18, 1069, 21,'Production Supervisor - WC60'),
(19, 1075, 185,'Production Technician - WC10'),
(20, 1129, 173,'Production Technician - WC30'),
(21, 1231, 148,'Production Control Manager'),
(22, 1172, 197,'Production Technician - WC45'),
(23, 1173, 197,'Production Technician - WC45'),
(24, 1113, 184,'Production Technician - WC30'),
(25, 1054, 21,'Production Supervisor - WC10'),
(109, 1287, NULL, 'Chief Executive Officer'),
(148, 1052, 109, 'Vice President of Production'),
(173, 1058, 21, 'Production Supervisor - WC30'),
(184, 1056, 21, 'Production Supervisor - WC30'),
(185, 1053, 21, 'Production Supervisor - WC10'),
(197, 1064, 21, 'Production Supervisor - WC45'),
(263, 1007, 3, 'Senior Tool Designer');



USE tempdb;
WITH

Emp AS (

--elect * from Employee
--select * from contact

SELECT e.EmployeeID, e.ManagerID,e.Title AS EmpTitle,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS EmpName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)
,

Mgr AS(
SELECT e.EmployeeID AS ManagerID,e.Title AS MgrTitle,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS MgrName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)



SELECT EmployeeID, Emp.ManagerID, EmpName, EmpTitle, MgrName, MgrTitle
FROM Emp INNER JOIN Mgr ON Emp.ManagerID = Mgr.ManagerID
ORDER BY EmployeeID;



Select * from (
SELECT e.EmployeeID, e.ManagerID,e.Title AS EmpTitle
--, d.title as ManagerTitle
,c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS EmpName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID ) as dd

INNER JOIN Contact AS d
ON dd.ManagerID = d.emp

SELECT e.EmployeeID AS ManagerID,e.Title AS MgrTitle,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS MgrName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID




WITH
Employees AS(
SELECT e.EmployeeID, e.ManagerID,e.Title,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS EmpName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)

SELECT emp.EmployeeID, emp.ManagerID, emp.EmpName, emp.Title AS EmpTitle,
mgr.EmpName as MgrName, mgr.Title as MgrTitle
FROM Employees AS Emp 
INNER JOIN Employees AS Mgr
ON Emp.ManagerID = Mgr.EmployeeID;




WITH Employees AS 
(
SELECT e.EmployeeID, e.ManagerID,e.Title,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS EmpName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)

SELECT EmployeeID, ManagerID, EmpName, Title
FROM Employees
WHERE EmployeeID IN (

SELECT EmployeeID
FROM Employees AS e
INNER JOIN AdventureWorks2008.HumanResources.Employee AS er2 
ON e.ManagerID = er2.BusinessEntityID
WHERE er2.MaritalStatus = 'S' or er2.MaritalStatus = 'M'



WITH Emp (EmployeeID, ManagerID, JobTitle,EmpName) AS
(SELECT e.EmployeeID, e.ManagerID,e.Title,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID)
SELECT Emp.EmployeeID, ManagerID, JobTitle, EmpName
FROM Emp;





USE tempdb;

WITH OrgChart (EmployeeID, ManagerID, Title, Level,Node)
AS (SELECT EmployeeID, ManagerID, Title, 0,
CONVERT(VARCHAR(30),'/') AS Node
FROM Employee
WHERE ManagerID IS NULL

UNION ALL

SELECT a.EmployeeID, a.ManagerID,a.Title, b.Level + 1,
CONVERT(VARCHAR(30),b.Node +
CONVERT(VARCHAR,a.ManagerID) + '/')
FROM Employee AS a

-- control of the recursion 
INNER JOIN OrgChart AS b ON a.ManagerID = b.EmployeeID

)
SELECT EmployeeID, ManagerID, SPACE(Level * 3) + Title AS Title, Level, Node
FROM OrgChart
);

SELECT *
From AdventureWorks2008.HumanResources.Employee AS er2 
WHERE er2.MaritalStatus <>'M'



USE AdventureWorks2008;
--1
SELECT OrderYear, [1] AS Jan, [2] AS Feb, [3] AS Mar,
[4] AS Apr, [5] AS May, [6] AS Jun, [7] AS july
FROM (

SELECT YEAR(OrderDate) AS OrderYear, TotalDue,
MONTH(OrderDate) AS OrderMonth
FROM Sales.SalesOrderHeader

) AS MonthData
PIVOT (
SUM(TotalDue)
FOR OrderMonth IN ([1],[2],[3],[4],[5],[6], [7])

) 
AS PivotData
ORDER BY OrderYear;



select * from Sales.SalesOrderHeader