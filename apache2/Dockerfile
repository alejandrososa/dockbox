# Dockerfile for Apache2 within TeamRock
#
# Details:
#  - Apache 2.4
##

# Pull base image.
FROM ubuntu:17.04

# Maintainer
MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

# Install Apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y --no-install-recommends apache2 \
    && rm -rf /var/lib/apt/lists/*

# Custom apache2 configuration
COPY conf.d/* /etc/apache2/conf-enabled/

# Remove default VirtualHost
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf /var/www/html

# Enable rewrite module
RUN a2enmod rewrite

# Configure Apache2
ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_LOG_DIR      /var/log/apache2
env APACHE_PID_FILE     /var/run/apache2.pid
env APACHE_RUN_DIR      /var/run/apache2
env APACHE_LOCK_DIR     /var/lock/apache2
env APACHE_LOG_DIR      /var/log/apache2

# Expose ourselves
EXPOSE 80 443

# Run!
ENTRYPOINT [ "/usr/sbin/apache2", "-DFOREGROUND" ]
