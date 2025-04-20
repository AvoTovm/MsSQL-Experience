-- 5.6

UPDATE Customers 
SET credit = credit + credit * 0.1

-- 5.7

UPDATE Orders 
SET sum_ord = 0 
WHERE DATEPART(YEAR,date_ord) = 2013