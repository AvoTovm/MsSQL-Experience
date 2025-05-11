-- 8.2

CREATE PROCEDURE BEGINING_CH
AS
BEGIN
SELECT ProductName
FROM Products
WHERE UnitPrice <= 20
AND ProductName LIKE 'Ch%'
END
GO

-- 8.3

CREATE PROCEDURE SELECT_NAMES WITH ENCRYPTION
AS
BEGIN
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
END
GO

-- 8.4 

CREATE PROCEDURE Cust_Make_Orders @argument DATETIME
AS
BEGIN
SELECT C.ContactName
FROM Customers AS C
JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.OrderDate = @argument
END
GO

-- 8.5

CREATE PROCEDURE Title @ARG nchar(5),
@title NVARCHAR(30) OUTPUT
AS
BEGIN
SELECT @title = C.ContactTitle
FROM Customers AS C
WHERE C.CustomerID = @ARG
END
GO

-- 8.6

sp_helptext BEGINING_CH

----------------------------------------

DECLARE @output NVARCHAR(30);
EXEC Title BLAUS, @title = @output OUTPUT
PRINT @output

EXEC SELECT_NAMES
EXEC Cust_Make_Orders (10-10-2019)

----------------------------------------