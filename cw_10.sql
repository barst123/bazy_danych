USE AdventureWorks2019;

--zad1
BEGIN TRAN T1;
UPDATE Production.Product
SET ListPrice=1.1*ListPrice
WHERE ProductID=680;
COMMIT TRAN T1;

SELECT * FROM Production.Product

--zad 2
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
BEGIN TRAN T2;
DELETE FROM Production.Product
WHERE ProductID=707;
ROLLBACK TRAN T2;

--zad 3
SET IDENTITY_INSERT Production.Product ON
BEGIN TRAN T3;
INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate)
VALUES (1000, 'Rowerek', 'R2-D2', 1, 1, 100, 75, 1234.56, 1999.99, 30, '2013-05-30 00:00:00.000', 'F5752C9C-56BA-41A7-83FD-139DA28C15FB', '2014-02-08 10:01:36.827');
COMMIT TRAN T3;

--zad 4
BEGIN TRAN T4;
UPDATE Production.Product
SET StandardCost=1.1*StandardCost;
IF (SELECT SUM(StandardCost) FROM Production.Product) <=500000
	BEGIN
		COMMIT TRAN T4;
	END;
ELSE
	BEGIN
		ROLLBACK TRAN T4;
	END;

SELECT * FROM Production.Product
SELECT SUM(StandardCost) FROM Production.Product

-- zad 5
SET IDENTITY_INSERT Production.Product ON

BEGIN TRAN T5;
IF EXISTS
(
SELECT *
FROM Production.Product
WHERE ProductID=1001
)
	BEGIN
		ROLLBACK TRAN T5;
	END;
ELSE
	BEGIN
		INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate)
		VALUES (1001, 'Super Rowerek_2', 'R3-D3', 1, 1, 100, 75, 1234.56, 1999.99, 30, '2013-05-30 00:00:00.000', 'F5752C9C-56BA-41A7-83FD-139DA28C15FC', '2014-02-08 10:01:36.827');
		COMMIT TRAN T5;
	END;

SELECT * FROM Production.Product

--zad 6
SELECT * FROM Sales.SalesOrderDetail
BEGIN TRAN T6;
UPDATE Sales.SalesOrderDetail
SET OrderQty=OrderQty-4;
DECLARE @order0 INT;
SET @order0=(SELECT COUNT(OrderQty) FROM Sales.SalesOrderDetail WHERE OrderQty=0);
IF @order0>0
	BEGIN
		ROLLBACK TRAN T6;
	END;
ELSE
	BEGIN
		COMMIT TRAN T6;
	END;

--zad 7
BEGIN TRAN T7;
DECLARE 
	@avg1 INT, 
	@count1 INT,
	@count2 INT;
SET @avg1=(SELECT AVG(StandardCost) FROM Production.Product);
SET @count1=(SELECT COUNT (ProductID) FROM Production.Product);
DELETE FROM Production.Product
WHERE StandardCost>@avg1;
SET @count2=(SELECT COUNT (ProductID) FROM Production.Product);
IF @count2+10<@count1
	BEGIN
		ROLLBACK TRAN T7;
	END;
ELSE
	BEGIN
		COMMIT TRAN T7;
	END;