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
Emp AS(
SELECT e.EmployeeID, e.ManagerID,e.Title AS EmpTitle,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS EmpName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)


--
,

--*select * from Emp

Mgr AS(
SELECT e.EmployeeID AS ManagerID,e.Title AS MgrTitle,
c.FirstName + ISNULL(' ' + c.MiddleName,'') + ' ' + c.LastName AS MgrName
FROM Employee AS e
INNER JOIN Contact AS c
ON e.ContactID = c.ContactID
)

--select * from Mgr

SELECT EmployeeID, Emp.ManagerID, EmpName, EmpTitle, MgrName, MgrTitle
FROM Emp INNER JOIN Mgr ON Emp.ManagerID = Mgr.ManagerID
ORDER BY EmployeeID;