select * from Sales.Customer

SELECT c.CustomerID,CountOfSales, c.StoreID,
SumOfTotalDue, AvgOfTotalDue
FROM Sales.Customer AS c INNER JOIN

-- this ia grouping to get aggregation 
(

SELECT CustomerID, COUNT(*) AS CountOfSales,
SUM(TotalDue) AS SumOfTotalDue,
AVG(TotalDue) AS AvgOfTotalDue
FROM Sales.SalesOrderHeader
GROUP BY CustomerID 

  ) AS s

--
ON c.CustomerID = s.CustomerID;


WITH s AS
(
SELECT CustomerID, COUNT(*) AS CountOfSales,
SUM(TotalDue) AS SumOfTotalDue,
AVG(TotalDue) AS AvgOfTotalDue
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
)

SELECT c.CustomerID,CountOfSales,
SumOfTotalDue, AvgOfTotalDue
FROM Sales.Customer AS c INNER JOIN s
ON c.CustomerID = s.CustomerID;



select * from Sales.SalesOrderHeader

SELECT c.CustomerID, SalesOrderID, TotalDue, AvgOfTotalDue
-- , TotalDue/SumOfTotalDue * 100 AS SalePercent
FROM Sales.SalesOrderHeader AS soh
INNER JOIN
( 
-- start
SELECT CustomerID, SUM(TotalDue) AS SumOfTotalDue,
AVG(TotalDue) AS AvgOfTotalDue
FROM Sales.SalesOrderHeader
GROUP BY CustomerID

) 

AS c ON soh.CustomerID = c.CustomerID
ORDER BY c.CustomerID;


-- Common Table Expression

WITH c AS
(
SELECT CustomerID, SUM(TotalDue) AS SumOfTotalDue,
AVG(TotalDue) AS AvgOfTotalDue
FROM Sales.SalesOrderHeader
GROUP BY CustomerID

)

SELECT c.CustomerID, SalesOrderID, TotalDue,AvgOfTotalDue
,TotalDue/SumOfTotalDue * 100 AS SalePercent
FROM Sales.SalesOrderHeader AS soh
INNER JOIN c ON soh.CustomerID = c.CustomerID
ORDER BY c.CustomerID;



SELECT CustomerID, SalesOrderID, TotalDue,
AVG(TotalDue) OVER(PARTITION BY CustomerID) AS AvgOfTotalDue,
SUM(TotalDue) OVER(PARTITION BY CustomerID) AS SumOfTOtalDue
,TotalDue/(SUM(TotalDue) OVER(PARTITION BY CustomerID)) * 100
AS SalePercentPerCustomer,
SUM(TotalDue) OVER() AS SalesOverAll
FROM Sales.SalesOrderHeader
ORDER BY CustomerID;



SELECT NULL AS SalesOrderID,SUM(UnitPrice)AS SumOfPrice,ProductID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 44175 AND 44180
GROUP BY ProductID
--UNION
SELECT SalesOrderID,SUM(UnitPrice) , NULL
FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 44175 AND 44180
GROUP BY SalesOrderID;


SELECT NULL AS SalesOrderID,SUM(UnitPrice)AS SumOfPrice,ProductID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 44175 AND 44180
GROUP BY ProductID
UNION all
SELECT SalesOrderID,SUM(UnitPrice)
, null as nullcol
FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 44175 AND 44180
GROUP BY SalesOrderID;

select * from sales.SalesOrderDetail

SELECT SalesOrderID,SUM(UnitPrice) AS SumOfPrice,ProductID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 44175 AND 44180
GROUP BY GROUPING SETS(SalesOrderID,ProductID);


SELECT FirstName, LastName, e.JobTitle, HireDate, CountOfTitle FROM HumanResources.Employee 
AS e INNER JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID 
INNER JOIN ( 
SELECT COUNT(*) AS CountOfTitle, JobTitle FROM HumanResources.Employee GROUP BY JobTitle
) 
AS j ON e.JobTitle = j.JobTitle; 
