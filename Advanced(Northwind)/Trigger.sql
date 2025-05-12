-- 10.1

CREATE TRIGGER t_PreventNull
ON Orders
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE ShipCountry IS NULL OR ShipCountry = ''
    )
 
    INSERT INTO Orders 
    SELECT *
    FROM inserted
END

INSERT INTO Orders (CustomerID, OrderDate) VALUES ('ALFKI', GETDATE())
Go

-- 10.2

CREATE TRIGGER t_PhoneUpdate
ON Customers
FOR UPDATE
AS
BEGIN
    IF UPDATE(Phone)
    BEGIN
        RAISERROR('not allowed', 16, 1)
    END
END

UPDATE Customers SET Phone = '123456789' WHERE CustomerID = 'ALFKI'
GO


-- 10.3

CREATE TRIGGER t_BlockTableChanges
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
BEGIN
    RAISERROR('not allowed', 16, 1)
END

DROP TABLE Orders;

ALTER TABLE Customers ADD TestCol INT
GO

-- 10.4

SELECT name AS TriggerName, object_name(parent_id) AS TableName
FROM sys.triggers
Go

-- 10.5

DISABLE TRIGGER ALL ON Customers;

UPDATE Customers SET Phone = '987654321' WHERE CustomerID = 'ALFKI'

ENABLE TRIGGER ALL ON Customers;
GO

-- 10.6

DROP TRIGGER t_PreventNull