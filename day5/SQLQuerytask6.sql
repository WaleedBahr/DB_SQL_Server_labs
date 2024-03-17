                       1
select salesorderid,shipdate from Sales.SalesOrderHeader
where  OrderDate BETWEEN '2002-07-28' AND '2014-07-29'

                       2
select productid,name from Production.Product
where StandardCost<110.00

                       3
select productid,name from Production.Product
where Weight is null

                       4
select * from Production.Product 
where Color in ('Silver', 'Black', 'Red')

                       5
select * from Production.Product
WHERE Name LIKE 'B%'

                      6
update Production.ProductDescription 
set Description='Chromoly steel_High of defects'
where ProductDescriptionID=3
SELECT *
FROM Production.ProductDescription
WHERE Description LIKE '%[_]%'

                       7
SELECT OrderDate, SUM(TotalDue) AS TotalDueSum
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2001-07-01' AND '2014-07-31'
GROUP BY OrderDate;

                       8
SELECT DISTINCT HireDate
FROM HumanResources.Employee

                       9
select AVG(distinct listprice) from Production.Product
    
                      10
SELECT 
'The ' + Name + ' is only! ' + 
  convert(VARCHAR(40),listprice) AS FormattedList 
FROM
  Production.Product
WHERE 
  ListPrice BETWEEN 100 AND 120
ORDER BY
  ListPrice
  
                       12
SELECT getdate() "DateStyle"
from Production.Product 
UNION
SELECT CONVERT(VARCHAR(50), GETDATE())
