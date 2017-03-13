FROM mysql:8.0

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

ADD ./startup /etc/mysql/startup

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DATABASE=demo
ARG MYSQL_USER=dev
ARG MYSQL_PASSWORD=123456
ARG MYSQL_ROOT_PASSWORD=root

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/startup && \
    sed -i 's/MYSQL_USER/'$MYSQL_USER'/g' /etc/mysql/startup && \
    sed -i 's/MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g' /etc/mysql/startup


ADD ./my.cnf /etc/mysql/conf.d/my.cnf
ADD ./sql/*.sh /docker-entrypoint-initdb.d/

CMD ["mysqld", "--init-file=/etc/mysql/startup"]

EXPOSE 3306