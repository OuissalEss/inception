#! /bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /tmp/init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';" >> /tmp/init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init.sql

mysql < /tmp/init.sql
