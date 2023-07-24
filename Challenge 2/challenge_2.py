import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Defcon00.',
    database='karyawan'
)

cursor = conn.cursor()

insert_sql = 'INSERT INTO biodata (first_name, last_name, age, sex, income) VALUES (%s, %s, %s, %s, %s)'
values = ('Jason', 'Moreno', 23, 'Male', 550)

try:
    cursor.execute(insert_sql, values)
    conn.commit()
except:
    conn.rollback()

cursor.close()
conn.close()