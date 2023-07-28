# Import mysql connector
import mysql.connector

# Do a conenction test
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Defcon00.',
    database='karyawan'
)

# Create a cursor object as a marker
cursor = conn.cursor()

# Declare SQL Query to insert record into 'karyawan' database
insert_sql = 'INSERT INTO biodata (first_name, last_name, age, sex, income) VALUES (%s, %s, %s, %s, %s)'
values = ('Jason', 'Moreno', 23, 'Male', 550)

try:
    # Execute SQL command
    cursor.execute(insert_sql, values)
    # Make changes (commit) to database
    conn.commit()
except:
    # DO a rollback if an error occurs or there is an issue
    conn.rollback()

# Close the connection
cursor.close()
conn.close()