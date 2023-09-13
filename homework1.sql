DROP DATABASE IF EXISTS homework_1;
CREATE DATABASE homework_1;
USE homework_1;

CREATE TABLE mobile_phones(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	product_name VARCHAR(25) NOT NULL, 
	manufacturer VARCHAR(25) NOT NULL,
	product_count INT,
	price INT
);

INSERT INTO mobile_phones (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X', 'Apple', 10, 500),
('iPhone 8', 'Apple', 5, 350),
('Y1810', 'VIVO', 25, 100),
('Galaxy S8', 'Samsung', 2, 400),
('Galaxy S9', 'Samsung', 1, 450),
('P20 Pro', 'Huawei', 4, 250);

SELECT id, product_name, manufacturer, product_count, price FROM mobile_phones;

SELECT product_name, manufacturer, price FROM mobile_phones
WHERE product_count > 2;

SELECT id, product_name, manufacturer, product_count, price FROM mobile_phones
WHERE manufacturer = "Samsung"; 