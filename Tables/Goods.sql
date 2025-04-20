CREATE TABLE Goods(
    id_goods INT NOT NULL,
    goods_name VARCHAR(50) NOT NULL,
    price MONEY,
    quantity INT,
    id_cust INT NOT NULL,
)