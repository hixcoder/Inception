#!/bin/bash

service mysql start 


echo "CREATE DATABASE IF NOT EXISTS $myDb_name ;" > myDb.sql
echo "CREATE USER IF NOT EXISTS '$myDb_user'@'%' IDENTIFIED BY '$myDb_pwd' ;" >> myDb.sql
echo "GRANT ALL PRIVILEGES ON $myDb_name.* TO '$myDb_user'@'%' ;" >> myDb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> myDb.sql
echo "FLUSH PRIVILEGES;" >> myDb.sql

mysql < myDb.sql

# kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
