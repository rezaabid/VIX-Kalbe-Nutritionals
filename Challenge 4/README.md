# Challenge 4: Perform Queries to Display Customer Orders Based on the the Conditions Provided

Challenge 4 has the goal of displaying all customer orders according to the given conditions by asking for the following data

<div align="center"><img src="https://drive.google.com/uc?export=view&id=1lpsNXKXF3Oi9PUGv2ZM544CUZB98Zjqx"></div>

The first thing to do is convert the data in the image above into a form that can be queried using SQL. By using the same database, namely the `KALBE` database, table creation as shown in the figure is given with the following syntax:

```sql
USE KALBE;

CREATE TABLE customer_orders(
	  order_no INT NOT NULL,
    purchase_amount INT NOT NULL,
    order_date DATE NOT NULL,
	  customer_id INT NOT NULL,
    salesman_id INT NOT NULL,
    PRIMARY KEY (order_no)
);

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
```

The output of the above syntax is as follows:

| order_no | purchase_amount | order_date | customer_id | salesman_id |
| -------- | --------------- | ---------- | ----------- | ----------- |
| 10001 | 150 | 2022-10-05 | 2005 | 3002 |
| 10009 | 270 | 2022-09-10 | 2001 | 3005 |
| 10002 | 65 | 2022-10-05 | 2002 | 3001 |
| 10004 | 110 | 2022-08-17 | 2009 | 3003 |
| 10007 | 948 | 2022-09-10 | 2005 | 3002 |
| 10005 | 2400 | 2022-07-27 | 2007 | 3001 |

Note that the desired rule is to display data for all customer orders whose purchase/order quantity is less than 100, or exclude orders whose order date is greater than or equal to 25 August 2022 and the customer id is below 2001. So the SQL query to display this is as follows:

```sql
SELECT * 
FROM customer_orders
WHERE purchase_amount < 100 OR order_no NOT IN (
	  SELECT order_no
    FROM customer_orders
    WHERE order_date >= '2022-08-25' AND customer_id > 2001
);
```

The output of the above syntax is as follows:

| order_no | purchase_amount | order_date | customer_id | salesman_id |
| -------- | --------------- | ---------- | ----------- | ----------- |
| 10002 | 65 | 2022-10-05 | 2002 | 3001 |
| 10004 | 110 | 2022-08-17 | 2009 | 3003 |
| 10005 | 2400 | 2022-07-27 | 2007 | 3001 |
| 10009 | 270 | 2022-09-10 | 2001 | 3005 |





