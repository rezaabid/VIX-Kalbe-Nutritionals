-- Use the 'KALBE' database from challenge 3 to create a new table
USE KALBE;

-- Create a table named 'customer_orders' and its associated columns
CREATE TABLE customer_orders(
	order_no INT NOT NULL,
    purchase_amount INT NOT NULL,
    order_date DATE NOT NULL,
	customer_id INT NOT NULL,
    salesman_id INT NOT NULL,
    PRIMARY KEY (order_no)
);

-- Insert multiple records into the 'customer_orders' table 
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10001, 150, '2022-10-05', 2005, 3002);
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10009, 270, '2022-09-10', 2001, 3005);
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10002, 65, '2022-10-05', 2002, 3001);
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10004, 110, '2022-08-17', 2009, 3003);
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10007, 948, '2022-09-10', 2005, 3002);
INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id) 
VALUES (10005, 2400, '2022-07-27', 2007, 3001);

/* 
Display all customer orders where purchase amount is less than 100 or exclude those orders
which order data is on or greater than 25 August 2022 and customer id is above 2001.
*/
SELECT * 
FROM customer_orders
WHERE purchase_amount < 100 OR order_no NOT IN (
	SELECT order_no
    FROM customer_orders
    WHERE order_date >= '2022-08-25' AND customer_id > 2001
);