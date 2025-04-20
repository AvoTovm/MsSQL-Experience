-- 3.1

SELECT id_ord, sum_ord, date_ord
FROM Orders

-- 3.2

SELECT * 
FROM customers 
WHERE id_cust = 8

-- 3.3

SELECT DISTINCT id_sel 
FROM Orders

-- 3.4

SELECT * 
FROM Customers 
WHERE rating_cust <= 60

-- 3.5.1

SELECT * 
FROM Orders 
WHERE DATEPART(YEAR, date_ord) = 2012 
AND DATEPART(MONTH, date_ord) IN (5, 6);

-- 3.5.2

SELECT * 
FROM Orders 
WHERE YEAR(date_ord) = 2012 
AND MONTH(date_ord) IN (1, 10);

-- 3.6

SELECT id_cust, lname_cust, rating_cust 
FROM Customers 
ORDER BY rating_cust DESC

-- 3.7

SELECT ROUND(comis_sel,1), plan_sel,UPPER (lname_sel) 
FROM Sellers

-- 3.8

SELECT id_sel, ABS(comis_sel) / ABS(plan_sel) AS total_ratio 
FROM Sellers

-- 3.9 

SELECT id_goods, goods_name, price, quanity, id_cust,
    price * (1 - (CASE WHEN RAND() < 0.5 THEN 0.10 ELSE 0.20 END)) AS new_price 
FROM Goods;

-- 3.10

SELECT id_cust ,SQRT(credit) AS Square_Credit 
FROM Customers 
ORDER BY Square_Credit

-- 3.11

SELECT id_cust, DATEDIFF(DAY, MAX(date_ord), GETDATE()) AS days_since_last_order
FROM Orders
GROUP BY id_cust;