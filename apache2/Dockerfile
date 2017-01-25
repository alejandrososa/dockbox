# Dockerfile for Apache2 within TeamRock
#
# Details:
#  - Apache 2.4
##

# Pull base image.
FROM ubuntu:17.04
#FROM webdevops/apache:ubuntu-16.04

# Maintainer
MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

# Update the package repository
RUN apt-get update -y && apt-get upgrade -y


# Install base system
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl nano apache2 \
    && rm -rf /var/lib/apt/lists/*

# Custom apache2 configuration
ADD config/000-docker.conf /etc/apache2/sites-available
RUN a2dissite 000-default
RUN a2ensite 000-docker
RUN apache2ctl restart

# Remove default VirtualHost
#RUN rm -rf /etc/apache2/sites-enabled/000-default.conf /var/www/html

# Enable rewrite module
#RUN a2enmod rewrite

# Configure Apache2
ENV TERM xterm

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN developer@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www

ARG PHP_SOCKET=php-fpm:9000
ENV WEB_PHP_SOCKET=$PHP_SOCKET
WORKDIR /var/www

EXPOSE 80 443

WORKDIR /var/www

#ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D FOREGROUND" ]

#CMD ["supervisord"]

# Expose ourselves
#EXPOSE 80 443

# Run!
#ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D FOREGROUND" ]
#ADD scripts/start.sh /start.sh
#RUN chmod 0755 /start.sh
#CMD ["bash", "start.sh"]
