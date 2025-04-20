-- 5.1

INSERT INTO Sellers (lname_sel,city_sel, comis_sel,leader, plan_sel)
VALUES ('Sahakyan G.', 'Abovyan', 15, 'Margaryan G.', 200),
        ('Manukyan S.', 'Hrazdan', 18,'Axajanyan S.', 300)

-- 5.2 null error

INSERT INTO Goods (goods_name,quanity)
VALUES ('Scaner T:3000', 25)

-- 5.3

CREATE TABLE Yerevan_Sellers (
    id_sel INT PRIMARY KEY,
    lname_sel VARCHAR(70),
    city_sel VARCHAR(30),
    comis_sel DECIMAL(18,0),
    leader VARCHAR(40),
    plan_sel INT,
)

INSERT INTO Yerevan_Sellers (id_sel, lname_sel, city_sel, comis_sel, leader, plan_sel)
SELECT * FROM Sellers 
WHERE city_sel = 'Yerevan'

