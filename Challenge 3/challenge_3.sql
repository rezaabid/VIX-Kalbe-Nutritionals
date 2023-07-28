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

-- Show item name that has the highest number in 'Item_total'
SELECT Item_name
FROM Inventory
ORDER BY Item_total DESC
LIMIT 1;

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

-- What will happen if inserting another item name with Item_code of 2343 into the table
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2343, 'Entrostop Tablet', 9000, 20);
/*
 The result of the SQL statement above will generate an error. This is because Item_code is the PRIMARY KEY
 in the Inventory table, so Item_code must be unique or there are no duplicates.
*/

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

-- View the content of 'Inventory' table
SELECT * FROM Inventory;