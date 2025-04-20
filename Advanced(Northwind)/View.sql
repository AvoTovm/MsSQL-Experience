-- 9.1

CREATE VIEW EmpNameView
AS
SELECT E.FirstName , E.LastName
FROM Employees AS E
GO
-- 9.2

CREATE VIEW EmpMaxFreightView WITH ENCRYPTION
AS
SELECT E.LastName, MAX(O.Freight) AS Max_Freight
FROM Employees AS E
JOIN Orders AS O
ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID, E.LastName
GO

-- 9.3

CREATE VIEW FindFuller
AS
SELECT E1.LastName
FROM Employees AS E1
JOIN Employees AS E2 
ON E1.ReportsTo = E2.EmployeeID
WHERE E2.LastName = 'Fuller'
GO

-- 9.4

CREATE VIEW ProductDiscount
AS
SELECT S.CompanyName, OD.Discount
FROM Suppliers AS S
JOIN Products AS P
ON P.SupplierID = S.SupplierID
JOIN [Order Details] AS OD
ON OD.ProductID = P.ProductID
WHERE OD.Discount > 0
GO