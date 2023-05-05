--zad1
USE AdventureWorks2019;

WITH TempEmployeeInfo
AS
(
	SELECT p.FirstName AS Imie, p.LastName AS Nazwisko, eph.Rate AS Stawka, e.JobTitle AS Stanowisko
	FROM HumanResources.EmployeePayHistory eph
	INNER JOIN  HumanResources.Employee e
	ON eph.BusinessEntityID=e.BusinessEntityID
	INNER JOIN Person.Person p
	ON eph.BusinessEntityID=p.BusinessEntityID
)
SELECT *
FROM TempEmployeeInfo;

--zad2
USE AdventureWorksLT2019;

WITH CTE_2
AS
(
	SELECT c.CompanyName+' ('+c.FirstName+' '+c.LastName+')' AS CompanyContact, sod.LineTotal AS LineTotal
	FROM SalesLT.Customer c
	INNER JOIN SalesLT.SalesOrderHeader soh
	ON c.CustomerID=soh.CustomerID
	INNER JOIN SalesLT.SalesOrderDetail sod
	ON soh.SalesOrderID=sod.SalesOrderID
)
SELECT CompanyContact, CAST(ROUND(SUM(LineTotal), 4) AS NUMERIC(16, 4)) AS Revenue
FROM CTE_2
GROUP BY CompanyContact;

--zad3
WITH CTE_3
AS
(
	SELECT pc.Name AS Category, s.LineTotal AS SalesValue
	FROM SalesLT.ProductCategory pc
	INNER JOIN SalesLT.Product p
	ON pc.ProductCategoryID=p.ProductCategoryID
	INNER JOIN SalesLT.SalesOrderDetail s
	ON p.ProductID=s.ProductID
)
SELECT Category, CAST(ROUND(SUM(SalesValue), 2) AS NUMERIC(16, 2)) AS SalesValue
FROM CTE_3
GROUP BY CTE_3.Category;