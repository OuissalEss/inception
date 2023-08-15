FROM debian:buster

RUN apt -y update && apt install mariadb-server -y

COPY ./tools/create_wd_db.sql /tmp/

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql < /tmp/create_wd_db.sql

CMD ["mysqld"]