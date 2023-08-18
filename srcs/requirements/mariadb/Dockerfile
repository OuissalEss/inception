FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYQL_ROOT_PASSWORD=${MYQL_ROOT_PASSWORD}
RUN apt -y update && apt install mariadb-server -y

COPY ./tools/script.sh script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "CREATE DATABASE $MYSQL_DATABASE;" >> /tmp/init.sql
RUN echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/init.sql
RUN echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';" >> /tmp/init.sql
RUN echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';" >> /tmp/init.sql
RUN echo "FLUSH PRIVILEGES;" >> /tmp/init.sql

RUN service mysql start && mysql < /tmp/init.sql

RUN chmod +x script.sh

CMD ["mysqld"]
