CREATE DATABASE lab8;
CREATE TABLE salesmen (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesmen(salesman_id)
);

INSERT INTO salesmen (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001);

--3
CREATE ROLE junior_dev WITH LOGIN PASSWORD 'password123';


--4
CREATE VIEW salesmen_in_new_york AS
SELECT *
FROM salesmen
WHERE city = 'New York';


--5
CREATE VIEW order_details AS
SELECT o.ord_no, s.name AS salesman_name, c.cust_name AS customer_name
FROM orders o
JOIN salesmen s ON o.salesman_id = s.salesman_id
JOIN customers c ON o.customer_id = c.customer_id;

--6
GRANT ALL PRIVILEGES on database lab8 TO junior_dev;



--7
CREATE VIEW customers_highest_grade AS
SELECT *
FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON customers_highest_grade TO junior_dev;



--8
CREATE VIEW salesman_count_by_city AS
SELECT city, COUNT(*) AS number_of_salesmen
FROM salesmen
GROUP BY city;



--9
CREATE VIEW salesmen_with_multiple_customers AS
SELECT s.name AS salesman_name, COUNT(c.customer_id) AS customer_count
FROM salesmen s
JOIN orders o ON s.salesman_id = o.salesman_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY s.name
HAVING COUNT(c.customer_id) > 1;

CREATE ROLE intern;
GRANT junior_dev TO intern;
GRANT CREATE ON SCHEMA public TO junior_dev;

Create  view name as
select c.cust_name
from customers c
join orders o on c.customer_id = o.customer_id
