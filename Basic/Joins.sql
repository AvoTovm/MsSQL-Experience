-- 6.1

SELECT S.lname_sel ,S.city_sel, O.sum_ord
FROM Sellers AS S
JOIN Orders AS O
ON S.id_sel = O.id_sel 
WHERE O.sum_ord <= 55000

-- 6.2

SELECT S.lname_sel, S.leader, SUM(O.sum_ord)
FROM Sellers AS S
JOIN Orders AS O
ON S.id_sel = O.id_sel
GROUP BY S.lname_sel, S.leader

-- 6.3

SELECT C.lname_cust, C.city_cust, SUM(O.sum_ord) AS Sum_Ord
FROM Customers AS C
JOIN Orders AS O
ON C.id_cust = O.id_cust
WHERE YEAR(date_ord) = 2024
GROUP BY C.lname_cust, C.city_cust

-- 6.4.LEFT

SELECT C.lname_cust, C.city_cust, G.goods_name
FROM Customers as C
LEFT JOIN Goods as G
ON C.id_cust = G.id_cust 

-- 6.4.RIGHT

SELECT C.lname_cust, C.city_cust, G.goods_name
FROM Customers as C
RIGHT JOIN Goods as G
ON C.id_cust = G.id_cust 

-- 6.5

SELECT C.lname_cust, O.date_ord ,SUM(O.sum_ord)
FROM Customers AS C
JOIN Orders AS O
ON C.id_cust = O.id_cust
WHERE DATEDIFF(MONTH, O.date_ord, '2013/6/30')<= 3
GROUP BY C.lname_cust, O.date_ord

-- 6.6

SELECT TOP 1 S.lname_sel, COUNT(S.id_sel) as max_order, AVG(O.sum_ord) as avg
FROM Sellers AS S
JOIN Orders AS O
ON S.id_sel = O.id_sel 
GROUP BY S.lname_sel
ORDER BY max_order DESC;

-- 6.7

SELECT G.goods_name, C.lname_cust
FROM Goods AS G
JOIN Customers AS C
ON G.id_cust = C.id_cust
JOIN Orders AS O
ON G.id_cust = O.id_cust
GROUP BY G.goods_name, C.lname_cust, G.price
HAVING G.price > AVG(O.sum_ord)