CREATE FUNCTION dbo.udf_Product(@num1 INT, @num2 INT) RETURNS INT AS
BEGIN
DECLARE @Product INT;
SET @Product = ISNULL(@num1,0) * ISNULL(@num2,0);
RETURN @Product;
END;
GO

Declare @a int;
Set @a = 5;
select dbo.udf_Product(2,@a);


Select dbo.udf_Delim2('HelloHello', ',')

-- , to every substring
CREATE FUNCTION dbo.udf_Delim2(@String VARCHAR(100),@Delimiter CHAR(1))
RETURNS VARCHAR(200) AS
BEGIN
DECLARE @NewString VARCHAR(200) = '';
DECLARE @Count INT = 1;
WHILE 
-- criteria
@Count <= LEN(@String) BEGIN
-- select Len('fdsds')
SET @NewString = SUBSTRING(@String,@Count,1) + @Delimiter;
--Select x+=x=1

SET @Count += 2;

--select SUBSTRING('Hello',1,1) + '
--select SUBSTRING('Hello',2,1) + ' 
--                         3
 

END

RETURN @NewString;

END
GO






















select dbo.udf_Delim8('hello',',')

Cather*ing - cathering
-- , to every substring

SELECT udfREPLACE('abc?efghicde','?');  


-- try this

CREATE FUNCTION dbo.udf_Delim9(@String VARCHAR(100),@Delimiter CHAR(1))
RETURNS varchar(200) 

AS

BEGIN
DECLARE @NewString VARCHAR(200) = '';
DECLARE @Count INT = 1;
WHILE 
@Count <= LEN(@String) 
BEGIN


-- add if here to compare if substring is the delimier?
IF SUBSTRING(@String,@Count,1) <> @Delimiter
(
SET @NewString = @Newstring+ SUBSTRING(@String,@Count,1)
);

SET @Count += 1;

END -- this end if for the while
RETURN @NewString;
END
GO



SELECT StoreID, TerritoryID,
dbo.udf_Product(StoreID, TerritoryID) AS TheProduct,
dbo.udf_Delim(FirstName,',') AS FirstNameWithCommas,
FirstName
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p ON c.PersonID= p.BusinessEntityID ;




SELECT PersonID,FirstName,LastName,JobTitle,BusinessEntityType
FROM dbo.ufnGetContactInformation(1);


SELECT e.BirthDate, e.Gender, c.FirstName,c.LastName,c.JobTitle
FROM HumanResources.Employee as e
CROSS APPLY dbo.ufnGetContactInformation(e.BusinessEntityID ) AS c;