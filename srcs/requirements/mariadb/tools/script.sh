#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > myDb.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> myDb.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> myDb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';" >> myDb.sql
echo "FLUSH PRIVILEGES;" >> myDb.sql

mysql  < myDb.sql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
