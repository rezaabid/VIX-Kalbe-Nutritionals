# Challenge 2: Connect and Insert Data to Database Using Python

Challenge 2 has the goal of connecting and entering data into the `karyawan` database using the Python programming language. This can be done by importing the mysql connector library to connect to the mysql server and performing CRUD operations on it, which can be done by writing the following syntax:

```python
import mysql.connector
```

Assuming the `karyawan` database has already been created, the syntax for connecting to the `karyawan` database is as follows:

```python
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Defcon00.',
    database='karyawan'
)
```

To perform an insert operation, a cursor is needed as an intermediary to be able to access the database. This can be done with the following syntax:

```python
cursor = conn.cursor()
```

Then specify the SQL command to enter data in the form of employee biodata. Which in this case is stored in variables named `insertt_sql` and `values` like the syntax below:

```python
insert_sql = 'INSERT INTO biodata (first_name, last_name, age, sex, income) VALUES (%s, %s, %s, %s, %s)'
values = ('Jason', 'Moreno', 23, 'Male', 550)
```


After that the specified SQL command is executed and committed, and do rollback if an error occurs. The corresponding syntax is given as follows:

```python
try:
    cursor.execute(insert_sql, values)
    conn.commit()
except:
    conn.rollback()
```

After all processes are complete, the cursor and connection to the database are closed by executing the following syntax:

```python
cursor.close()
conn.close()
```

The following is a display of the data that has been entered into the `biodata` table in the `karyawan` database

| first_name | last_name | age | sex | income |
|------------|-----------|-----|-----|--------|
| Jason | Moreno | 23 | Male | 550 |


