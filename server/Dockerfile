FROM phusion/baseimage:latest

# Maintainer
MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>


RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# Add the "PHP 7" ppa
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php

#Net tools
#RUN apt-get install -y net-tools

#
#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
#

# Install "PHP Extentions", "libraries", "Software's"
RUN apt-get update && \
    apt-get install -y --force-yes \
        sudo \
        php7.0-cli \
        php7.0-common \
        php7.0-curl \
        php7.0-json \
        php7.0-xml \
        php7.0-mbstring \
        php7.0-mcrypt \
        php7.0-mysql \
        php7.0-pgsql \
        php7.0-sqlite \
        php7.0-sqlite3 \
        php7.0-zip \
        php7.0-bcmath \
        php7.0-memcached \
        php7.0-gd \
        php7.0-dev \
        pkg-config \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        sqlite3 \
        git \
        curl \
        vim \
        nano \
        postgresql-client \
        git-core \
        zlib1g-dev \
        build-essential \
        libreadline-dev \
        libyaml-dev \
        libxslt1-dev \
        python-software-properties \
        libffi-dev \
        nodejs \
        ruby-full \
    && apt-get clean


#####################################
# Composer:
#####################################

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Source the bash
RUN . ~/.bashrc



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


#####################################
# Composer:
#####################################

# Add the composer.json
COPY ./composer.json /home/desarrollador/.composer/composer.json

# Make sure that ~/.composer belongs to desarrollador
RUN chown -R desarrollador:desarrolladores /home/desarrollador/.composer
USER desarrollador

# Check if global install need to be ran
ARG COMPOSER_GLOBAL_INSTALL=false
ENV COMPOSER_GLOBAL_INSTALL ${COMPOSER_GLOBAL_INSTALL}
RUN if [ ${COMPOSER_GLOBAL_INSTALL} = true ]; then \
    # run the install
    composer global install && composer global update \
;fi

#####################################
# Crontab
#####################################
USER root

RUN apt-get update && apt-get install nano

COPY ./crontab /etc/cron.d
RUN chmod -R 644 /etc/cron.d
#RUN apt-get install openssh-server

#####################################
# User Aliases
#####################################
USER desarrollador

COPY ./aliases.sh /home/desarrollador/aliases.sh
COPY ./aliases.sh /home/desarrollador/.aliases
RUN echo "" >> ~/.bashrc
RUN echo "# Load Custom Aliases" >> ~/.bashrc
RUN echo "source /home/desarrollador/aliases.sh" >> ~/.bashrc && \
    echo "#Composer Tools" >> ~/.bashrc && \
    echo "export PATH=/home/desarrollador/.composer/vendor/bin:$PATH" >> ~/.bashrc

USER root
RUN echo "" >> ~/.bashrc && \
    echo "# Load Custom Aliases" >> ~/.bashrc && \
    echo "source /home/desarrollador/aliases.sh" >> ~/.bashrc && \
    echo "" >> ~/.bashrc && \
    echo "#Composer Tools" >> ~/.bashrc && \
    echo "export PATH=/home/desarrollador/.composer/vendor/bin:$PATH" >> ~/.bashrc

#####################################
# xDebug:
#####################################

ARG INSTALL_XDEBUG=false
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    # Load the xdebug extension only with phpunit commands
    apt-get update && \
    apt-get install -y --force-yes php7.0-xdebug && \
    sed -i 's/^/;/g' /etc/php/7.0/cli/conf.d/20-xdebug.ini \
#    sed -i 's/^/;/g' /etc/php/7.0/cli/conf.d/20-xdebug.ini && \
#    echo "alias phpunit='php -dzend_extension=xdebug.so /var/www/vendor/bin/phpunit'" >> ~/.bashrc \
;fi
# ADD for REMOTE debugging
COPY ./xdebug.ini /etc/php/7.0/cli/conf.d/xdebug.ini

#####################################
# ssh:
#####################################
ARG INSTALL_WORKSPACE_SSH=false
ENV INSTALL_WORKSPACE_SSH ${INSTALL_WORKSPACE_SSH}

#ADD desarrollador_rsa /tmp/id_rsa
#ADD desarrollador_rsa.pub /tmp/id_rsa.pub
ADD ssh/insecure_id_rsa /tmp/id_rsa
ADD ssh/insecure_id_rsa.pub /tmp/id_rsa.pub
ADD ssh/ssh-key /tmp/ssh-key
ADD ssh/sshd_config /etc/ssh/sshd_config
RUN ssh-keygen -A

RUN if [ ${INSTALL_WORKSPACE_SSH} = true ]; then \
    rm -f /etc/service/sshd/down && \
    cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys \
        && cat /tmp/id_rsa.pub >> /root/.ssh/id_rsa.pub \
        && cat /tmp/id_rsa >> /root/.ssh/id_rsa \
        && cat /tmp/ssh-key >> /root/.ssh/authorized_keys \
        && rm -f /tmp/id_rsa* \
        && chmod 644 /root/.ssh/authorized_keys /root/.ssh/id_rsa.pub \
    && chmod 400 /root/.ssh/id_rsa \
    && service ssh restart \
;fi


USER desarrollador

ADD ssh/insecure_id_rsa /tmp/id_rsa
ADD ssh/insecure_id_rsa.pub /tmp/id_rsa.pub
ADD ssh/ssh-key /tmp/ssh-key
ADD ssh/sshd_config /etc/ssh/sshd_config
RUN ssh-keygen -A

RUN if [ ${INSTALL_WORKSPACE_SSH} = true ]; then \
    rm -f /etc/service/sshd/down && \
    mkdir -p /home/desarrollador/.ssh && \
    cat /tmp/id_rsa.pub >> /home/desarrollador/.ssh/authorized_keys \
        && cat /tmp/id_rsa.pub >> /home/desarrollador/.ssh/id_rsa.pub \
        && cat /tmp/id_rsa >> /home/desarrollador/.ssh/id_rsa \
        && cat /tmp/ssh-key >> /home/desarrollador/.ssh/authorized_keys \
        && chmod 644 /home/desarrollador/.ssh/authorized_keys /home/desarrollador/.ssh/id_rsa.pub \
    && chmod 400 /home/desarrollador/.ssh/id_rsa \
    && service ssh restart \
;fi



#####################################
# Ruby:
#####################################
#USER desarrollador
#
#RUN cd && \
#    git clone git://github.com/sstephenson/rbenv.git .rbenv && \
#    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
#    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
#    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
#    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile && \
#    source ~/.bash_profile
#
#USER root
#
#RUN cd && \
#    git clone git://github.com/sstephenson/rbenv.git .rbenv && \
#    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
#    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
#    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
#    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile && \
#    source ~/.bash_profile




USER desarrollador

#####################################
# Node / NVM:
#####################################

# Check if NVM needs to be installed
ARG NODE_VERSION=stable
ENV NODE_VERSION ${NODE_VERSION}
ARG INSTALL_NODE=false
ENV INSTALL_NODE ${INSTALL_NODE}
ENV NVM_DIR /home/desarrollador/.nvm
RUN if [ ${INSTALL_NODE} = true ]; then \
    # Install nvm (A Node Version Manager)
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash && \
        . $NVM_DIR/nvm.sh && \
        nvm install ${NODE_VERSION} && \
        nvm use ${NODE_VERSION} && \
        nvm alias ${NODE_VERSION} && \
        npm install -g less &&\
        npm install -g sass &&\
        npm install -g webpack &&\
        npm install -g typescript &&\
        npm install -g vue &&\
        npm install -g react react-dom &&\
        npm install -g gulp bower vue-cli gulp-cli \
;fi

# Wouldn't execute when added to the RUN statement in the above block
# Source NVM when loading bash since ~/.profile isn't loaded on non-login shell
RUN if [ ${INSTALL_NODE} = true ]; then \
    echo "" >> ~/.bashrc && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc \
;fi

# Add NVM binaries to root's .bashrc
USER root

RUN if [ ${INSTALL_NODE} = true ]; then \
    echo "" >> ~/.bashrc && \
    echo 'export NVM_DIR="/home/desarrollador/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc \
;fi


#####################################
# Non-root user : FRAMEWORKS
#####################################

# add ./vendor/bin to non-root user's bashrc (needed for phpunit)
USER root

RUN mkdir -p /usr/local/bin && \
    curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony  && \
    chmod a+x /usr/local/bin/symfony


#RUN source ~/.bashrc

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

# Clean up
USER root
RUN echo "" >> /etc/sudoers  && \
    echo "# User privilege specification" >> /etc/sudoers  && \
    echo "desarrollador   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers  && \
    echo "" >> /etc/sudoers

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set default work directory
WORKDIR /var/www
