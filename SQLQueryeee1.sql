USE AdventureWorks2008R2;
GO
SELECT   ProductNumber, Category =
      CASE ProductLine
         WHEN 'R' THEN 'Road'
         WHEN 'M' THEN 'Mountain'
         WHEN 'T' THEN 'Touring'
         WHEN 'S' THEN 'Other sale items'
         ELSE 'Not for sale'
      END,
   Name
FROM Production.Product
ORDER BY ProductNumber;
GO

select productline from 
 Production.Product

 select productline,


 IF productline = 'T' THEN
      select 'Tall';
   ELSE
     select 'low';
   END IF;

   from 
 Production.Product



 
SELECT   ProductNumber, Category =
      if ProductLine
         ='R' THEN 'Road'
              END,
   --
FROM Production.Product
ORDER BY ProductNumber;
GO

-- hello
