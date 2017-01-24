FROM ubuntu:17.04

# Maintainer
MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

#####################################
# Non-Root User:
#####################################

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ARG PGID=1000
RUN groupadd -g $PGID desarrolladores && \
    useradd -u $PUID -g desarrolladores -m desarrollador

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone