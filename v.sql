SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;



SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader;

SELECT sum(CustomerID), SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;



SELECT AVG(TotalDue) aS AveragePerTerritory,TerritoryID 
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
--order by AveragePerTerritory desc


SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrderYearxxx
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)


SELECT CustomerID, count(CustomerID) AS countcutid
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
having count(customerid) = 10



SELECT 
c.CustomerID
, c.AccountNumber
, COUNT(*) AS CountOfOrders
,SUM(s.TotalDue) AS SumOfTotalDue
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
GROUP BY 
c.CustomerID
,c.AccountNumber
ORDER BY c.CustomerID;

select * from Sales.SalesOrderHeader where CustomerID = 11000