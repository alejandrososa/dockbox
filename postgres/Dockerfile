FROM postgres:latest

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

ENV TERM xterm

RUN apt-get update && apt-get install -y --force-yes nano vim

ADD ./sql/*.sh /docker-entrypoint-initdb.d/
COPY ./pg_hba.conf /var/lib/postgresql/data/pg_hba.conf
COPY ./postgresql.conf /var/lib/postgresql/data/postgresql.conf

USER postgres
RUN mkdir -p /var/lib/postgresql/backup

VOLUME ["/var/log/postgresql/", "var/lib/postgresql/data", "var/lib/postgresql/backup"]
CMD ["postgres"]
EXPOSE 5432