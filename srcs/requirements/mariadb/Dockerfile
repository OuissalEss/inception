FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
MYSQL_DATABASE
# ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

RUN apt -y update && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh script.sh

RUN echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> /tmp/init.sql
RUN echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/init.sql
RUN echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';" >> /tmp/init.sql
RUN echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/init.sql
RUN echo "FLUSH PRIVILEGES;" >> /tmp/init.sql

RUN service mysql start && mysql < /tmp/init.sql

RUN chmod +x script.sh

# RUN bash ./script.sh

CMD ["mysqld"]
