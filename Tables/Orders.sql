CREATE TABLE Orders(
    id_ord INT PRIMARY KEY NOT NULL,
    sum_ord DECIMAL(18, 0),
    date_ord DATETIME,
    id_sel INT NOT NULL,
    id_cust INT NOT NULL,
)