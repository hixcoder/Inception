#!/bin/bash

db_name="wordpress"
db_user="hboumahd"
db_pass="hix1234"

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $db_name;" > myDb.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass';" >> myDb.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';" >> myDb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root0000';" >> myDb.sql
echo "FLUSH PRIVILEGES;" >> myDb.sql

mysql  < myDb.sql
echo "-------------------------------"
mysql -u hboumahd -p"hix1234"
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld
