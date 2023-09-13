DROP DATABASE IF EXISTS homework5;
CREATE DATABASE homework5;

USE homework5;

CREATE TABLE cars (
    REGNUM VARCHAR(10) PRIMARY KEY,
    MARK VARCHAR(10),
    COLOR VARCHAR(15),
    COST DECIMAL,
    RELEASEDT DATE,
    PHONENUM VARCHAR(15)
);

INSERT INTO cars (REGNUM, MARK,	COLOR, COST, RELEASEDT, PHONENUM ) 
VALUES
	(111114,'LADA', 'КРАСНЫЙ', 18927, date'2008-01-01', '9152222221'),
	(111115,'VOLVO', 'КРАСНЫЙ', 64324, date'2013-01-01', '9173333334'),
	(111116,'BMW', 'СИНИЙ', 132492, date'2015-01-01', '9173333334'),
	(111121,'AUDI', 'СИНИЙ', 55205, date'2009-01-01', '9173333332'),
	(111122,'AUDI', 'СИНИЙ', 45000, date'2011-01-01', '9213333336'),
	(111113,'BMW', 'ЗЕЛЕНЫЙ', 78345, date'2007-01-01', '9214444444'),
	(111126,'LADA', 'ЗЕЛЕНЫЙ', 14980, date'2005-01-01', null),
	(111117,'BMW', 'СИНИЙ', 96023, date'2005-01-01', null),
	(111119,'LADA', 'СИНИЙ', 16700, date'2017-01-01', 9213333331),
	(111120,'SKODA', 'ЗЕЛЕНЫЙ', 30927, date'2008-01-01', '9152222221'),
	(111118,'SKODA', 'ЧЕРНЫЙ', 29001, date'2013-01-01', '9173333334');

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW cheap_cars AS
    SELECT 
        *
    FROM
        cars
    WHERE
        COST < 25000;

SELECT 
    *
FROM
    cheap_cars;

-- Измените в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cheap_cars AS 
	SELECT 
		MARK
	FROM 
		cars
	WHERE 
		COST < 30000;

SELECT 
    *
FROM
    cheap_cars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW skoda_and_audi AS
    SELECT 
        *
    FROM
        cars
    WHERE
        MARK = 'SKODA' OR MARK = 'AUDI';

SELECT 
    *
FROM
    skoda_and_audi;

SELECT 
    Analysis.an_name, Analysis.an_cost, Orders.ord_datetime
FROM
    Analysis
        JOIN
    Orders ON Orders.ord_an = Analysis.an_id
WHERE
    Orders.ord_datetime >= '2020-02-05'
        AND Orders.ord_datetime < '2020-02-12';  