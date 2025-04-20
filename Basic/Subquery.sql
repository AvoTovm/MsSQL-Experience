-- 7.1

SELECT *
FROM Orders AS O 
WHERE O.sum_ord = ANY(
    SELECT C.credit
    FROM Customers AS C
)

-- 7.2

SELECT *
FROM Customers AS C 
WHERE C.id_cust = ANY(
    SELECT O.id_cust
    FROM Orders AS O
    WHERE O.sum_ord = 60000
)

-- 7.3

SELECT *
FROM Customers AS C
WHERE C.id_cust = ANY(
    SELECT O.id_cust
    FROM Orders AS O
    GROUP BY O.id_cust
)

-- 7.4

SELECT S.lname_sel
FROM Sellers AS S
WHERE S.plan_sel > (
    SELECT AVG(S.plan_sel)
    FROM Sellers AS S
)

-- 7.5

SELECT S.lname_sel, (SELECT COUNT(id_sel) FROM Orders WHERE S.id_sel = id_sel)
FROM Sellers AS S
WHERE S.city_sel = 'Yerevan'