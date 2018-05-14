SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID
FROM Sales.Customer AS C
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE C.CustomerID IN (11028,11029,1,2,3,4);




SELECT TABLE2.CustomerID,SUM(TABLE1.cOUNTOFORDERS) AS FINALTOTAL
--,TABLE1.SalesOrderID 
FROM (select SalesOrderID, COUNT(OrderQty) cOUNTOFORDERS from Sales.SalesOrderDetail
GROUP BY SalesOrderID) AS TABLE1
INNER JOIN SALES.SalesOrderHeader AS TABLE2 ON taBLE1.SALESORDERID=TABLE2.sALESORDERID
GROUP BY taBLE2.CustomerID

SELECT c.CustomerID, c.AccountNumber, COUNT(*) AS CountOfOrders,
SUM(TotalDue) AS SumOfTotalDue
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.AccountNumber
ORDER BY c.CustomerID;


SELECT (TotalDue) AS SumOfTotalDue
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.AccountNumber
ORDER BY c.CustomerID;



SELECT CustomerID, SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader AS soh
WHERE 10 =
(SELECT COUNT(*)
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = soh.SalesOrderID);


SELECT *
FROM Sales.SalesOrderDetail