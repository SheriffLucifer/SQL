DROP DATABASE IF EXISTS classwork_5;
CREATE DATABASE classwork_5;

USE classwork_5;

SELECT 
    *
FROM
    homework3.staff;
 
 -- 1. Вывести список всех сотрудников и указать место в рейтинге по зарплатам
 
SELECT 
DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_salary, # Ранжирование заданного поля и его сортировка по убыванию.
CONCAT(first_name, ' ', last_name), post, salary FROM staff
ORDER BY rank_salary;

-- 2. Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по каждой должности.

SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, # Ранжирование по двум столбцам плюс сортировка.
CONCAT(first_name, ' ', last_name), post, salary
FROM staff ORDER BY post, rank_salary;

-- 3. Найти самых высокооплачиваемых сотрудников по каждой должности

SELECT rank_salary, staff, post, salary FROM
(SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, # Ранжирование по двум столбцам плюс сортировка.
CONCAT(first_name, ' ', last_name) AS staff, post, salary FROM staff) AS list
WHERE rank_salary=1
ORDER BY salary DESC;

-- 4. Вывести список всех сотрудников, отсортировав по зарплатам в порядке
-- убывания и указать на сколько процентов ЗП меньше, чем у сотрудника со
-- следующей (по значению) зарплатой

SELECT
id, 
CONCAT(first_name, ' ', last_name) AS staff, 
post, 
salary,
LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) AS last_sarary, # Смотрим на зарплаты с помощью функций смещения и сортируем по убыванию.
ROUND((salary-LEAD(salary, 1, 0) OVER(ORDER BY salary DESC)) * 100 / salary) # Смещение делить на зп. 
AS diff_percent
FROM staff;

-- 5. Вывести всех сотрудников, сгруппировав по должностям и рассчитать:
-- общую сумму зарплат для каждой должности
-- процентное соотношение каждой зарплаты от общей суммы по должности
-- среднюю зарплату по каждой должности
-- процентное соотношение каждой зарплаты к средней зарплате по должности
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по
-- каждой должности

SELECT
id, 
CONCAT(first_name, ' ', last_name) AS staff, 
post, 
salary,
SUM(salary) OVER w AS sum_salary,
ROUND(salary * 100 / SUM(salary) OVER w) AS percent_sum,
AVG(salary) OVER w AS avg_salary,
ROUND(salary * 100 / AVG(salary) OVER w) AS percent_avg
FROM staff
WINDOW w AS (PARTITION BY post);

SELECT
id, 
salary, 
AVG(salary) OVER w AS avg_salary, # выводим среднюю зп
MIN(salary) OVER w AS min_salary, # выводим минимальную зп
MAX(salary) OVER w AS max_salary, # выводим максимальную зп
SUM(salary) OVER w AS sum_salary, # выводим сумму зп
COUNT(salary) OVER w AS count_salary # выводим количество зп
FROM staff
WINDOW w AS (PARTITION BY id);

-- Временная таблица (TEMPORARY TABLE)
#DROP TEMPORARY TABLE new_sta;
CREATE TEMPORARY TABLE new_sta
SELECT * FROM staff LIMIT 10;

SELECT * FROM new_sta;

-- Общее табличное выражение (WITH)
WITH
cte1 AS (SELECT id, salary FROM staff),
cte2 AS (SELECT id, salary FROM staff)
SELECT cte1.id, cte2.salary FROM cte1 JOIN cte2
WHERE cte1.id = cte2.id;

-- Представление (VIEW)
-- CREATE OR REPLACE VIEW v_staff
-- SELECT * FROM new_sta LIMIT 10;
