#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS wordpress;" > myDb.sql
echo "CREATE USER IF NOT EXISTS 'hboumahd'@'%' IDENTIFIED BY 'hix1234';" >> myDb.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'hboumahd'@'%';" >> myDb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'hix0000';" >> myDb.sql
echo "FLUSH PRIVILEGES;" >> myDb.sql

mysql < myDb.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

