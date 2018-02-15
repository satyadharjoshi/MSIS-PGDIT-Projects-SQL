IF OBJECT_ID('dbo.usp_CustomerName') IS NOT NULL BEGIN
DROP PROC dbo.usp_CustomerName;
END;
GO


--2
CREATE PROC dbo.usp_CustomerName AS
SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
ORDER BY p.LastName, p.FirstName,p.MiddleName ;
RETURN 0;
GO


EXEC dbo.usp_CustomerName
GO


USE AdventureWorks2008R2;
GO
IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL
    DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;
GO
CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD
@SalesPerson nvarchar(50),
@SalesYTD money OUTPUT
AS  

    SET NOCOUNT ON;
    SELECT @SalesYTD = SalesYTD
    FROM Sales.SalesPerson AS sp
    JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID
    WHERE LastName = @SalesPerson;
RETURN
GO



DECLARE @SalesYTDBySalesPerson money;
-- Execute the procedure specifying a last name for the input parameter
-- and saving the output value in the variable @SalesYTDBySalesPerson
EXECUTE Sales.uspGetEmployeeSalesYTD
    N'Blythe', @SalesYTD = @SalesYTDBySalesPerson OUTPUT;
-- Display the value returned by the procedure.
PRINT 'Year-to-date sales for this employee is ' + 
    convert(varchar(10),@SalesYTDBySalesPerson);
GO