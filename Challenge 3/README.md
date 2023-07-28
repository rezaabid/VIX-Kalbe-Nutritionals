# Challenge 3: Perform SQL CRUD Operations on Kalbe Database

Challenge 3 has the goal of changing the data in the following table

<div align="center"><img src="https://drive.google.com/uc?export=view&id=1JmSbh24mH5MlibpZfb_TF9RQ6eMc4aKY"></div>

into the SQL query language stored in the `Inventory` table in the `KALBE` database so that further CRUD operations can be performed

The first thing to do is to create the `KALBE` database and `Inventory` table along with related data according to the image given earlier

```sql
-- Create a database named 'KALBE' and use it to create a table
CREATE DATABASE KALBE;
USE KALBE;

-- Create a table named 'Inventory' and its associated columns
CREATE TABLE Inventory (
  Item_code INT NOT NULL,
  Item_name VARCHAR(255) NOT NULL,
  Item_price INT NULL,
  Item_total INT NULL,
  PRIMARY KEY (Item_code)
);

-- Insert multiple records into the 'Inventory' table 
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2341, 'Promag Tablet', 3000, 100);
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2342, 'Hydro Coco 250ML', 7000, 20);
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2343, 'Nutrive Benecol 100ML', 20000, 30);
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2344, 'Blackmores Vit C 500Mg', 95000, 45);
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2345, 'Entrasol Gold 370G', 90000, 120);
```

Here's the output given by running the previous syntax

| Item_code | Item_name | Item_price | Item_total |
| --------- | --------- | ---------- | ---------- |
| 2341 | Promag Tablet | 3000 | 100 |
| 2342 | Hydro Coco 250ML | 7000 | 20 |
| 2343 | Nutrive Benecol 100ML | 20000 | 30 |
| 2344 | Blackmores Vit C 500Mg | 95000 | 45 |
| 2345 | Entrasol Gold 370G | 90000 | 120 |

From the data that has been provided, it will display `Item_name` which has the highest number of `Item_total`

```sql
-- Show item name that has the highest number in 'Item_total'
SELECT Item_name
FROM Inventory
ORDER BY Item_total DESC
LIMIT 1;
```

Here's the output given by running the previous syntax

| Item_name |
| --------- |
| Entrasol Gold 370G |

From the previous output, update `Item_price`

```sql
-- Update the item price for previous output result
WITH Highest_total AS (
  SELECT Item_name
	FROM Inventory
	ORDER BY Item_total DESC
	LIMIT 1
)

UPDATE Inventory
SET Item_price = 70000
WHERE Item_name IN (
	SELECT Item_name
	FROM Highest_total
);
```

Here's the output given by running the previous syntax

| Item_code | Item_name | Item_price | Item_total |
| --------- | --------- | ---------- | ---------- |
| 2341 | Promag Tablet | 3000 | 100 |
| 2342 | Hydro Coco 250ML | 7000 | 20 |
| 2343 | Nutrive Benecol 100ML | 20000 | 30 |
| 2344 | Blackmores Vit C 500Mg | 95000 | 45 |
| 2345 | Entrasol Gold 370G | 70000 | 120 |

If trying to insert another `Item_name` with value `Item_code = 2343` into the `Inventory` table

```sql
-- What will happen if inserting another item name with Item_code of 2343 into the table
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2343, 'Entrostop Tablet', 9000, 20);
```

Will produce an error because `Item_code` is the **PRIMARY KEY** for the `Inventory` table, where `Item_code` must be unique or there are no duplicates

Furthermore, from the data that has been given, `Item_name` will be deleted which has the smallest `Item_total`

```sql
-- Delete the Item_name that has the lowest number of Item_total
WITH Lowest_total AS (
	SELECT Item_name
	FROM Inventory
	ORDER BY Item_total ASC
	LIMIT 1
)

DELETE FROM Inventory 
WHERE Item_name IN (
	SELECT Item_name
	FROM Lowest_total
);
```

Here's the output given by running the previous syntax

| Item_code | Item_name | Item_price | Item_total |
| --------- | --------- | ---------- | ---------- |
| 2341 | Promag Tablet | 3000 | 100 |
| 2343 | Nutrive Benecol 100ML | 20000 | 30 |
| 2344 | Blackmores Vit C 500Mg | 95000 | 45 |
| 2345 | Entrasol Gold 370G | 70000 | 120 |
