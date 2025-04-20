-- 4.1

SELECT MAX(rating_cust), city_cust
FROM Customers 
GROUP BY city_cust

-- 4.2

SELECT YEAR (date_ord), AVG(sum_ord) as Average
FROM Orders 
GROUP BY YEAR(date_ord)

-- 4.3

SELECT city_cust , lname_cust, rating_cust 
FROM Customers 
WHERE city_cust IN ('Yerevan')

-- 4.4

SELECT lname_sel 
FROM Sellers 
WHERE ASCII(lname_sel) = 77 

-- 4.5

SELECT C.lname_cust, MIN(C.rating_cust) AS rating_cust, SUM(O.sum_ord) AS sum_ord
FROM Customers AS C, Orders AS O
WHERE O.id_cust = C.id_cust
GROUP BY C.lname_cust

-- 4.6

SELECT MIN(S.id_sel) AS ID, S.lname_sel, MIN(O.date_ord) AS date_ord
FROM Sellers AS S, Orders AS O
WHERE S.id_sel = O.id_sel AND S.city_sel IN ('Yerevan') AND YEAR(O.date_ord) < 2013
GROUP BY S.lname_sel

-- 4.7

SELECT city_cust , AVG(credit) 
FROM Customers
GROUP BY city_cust

-- 4.8

SELECT goods_name, FORMAT(price,'C','eu-US') as Price 
FROM Goods 
WHERE ASCII(goods_name) = 77 AND quanity > 10 

-- 4.9

SELECT city_sel, SUM(POWER(comis_sel,2)) as Com_sum 
FROM Sellers 
GROUP BY city_sel