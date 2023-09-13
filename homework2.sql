DROP DATABASE IF EXISTS homework_2;
CREATE DATABASE homework_2;
USE homework_2;

CREATE TABLE sales(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product)
VALUES
(DATE '2023-01-01', 248),
(DATE '2023-01-02', 355),
(DATE '2023-01-03', 208),
(DATE '2023-01-04', 124),
(DATE '2023-01-05', 520),
(DATE '2023-01-06', 38),
(DATE '2023-01-07', 215),
(DATE '2023-01-08', 55);
    
SELECT id,
    CASE
		WHEN count_product < 100 THEN "Меньше 100"
        WHEN count_product BETWEEN 100 AND 300 THEN "От 100 до 300"
        ELSE "Больше 300"
    END AS "Сегмент заказа"
FROM sales;

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(25),
    amount FLOAT DEFAULT 0.0,
	order_status VARCHAR(25)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('s03', 18.00, "OPEN"),
('e01', 45.50, "OPEN"),
('e05', 88.55, "CLOSED"),
('e02', 30.99, "OPEN"),
('e04', 7.25, "CANCELLED");

SELECT
	id,
    employee_id,
    amount,
    order_status,
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE ""
    END AS full_order_status
FROM orders;