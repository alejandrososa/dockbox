FROM postgres:latest

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

ADD ./sql/*.sh /docker-entrypoint-initdb.d/

VOLUME ["/var/log/postgresql/", "var/lib/postgresql/data"]
CMD ["postgres"]

EXPOSE 5432