FROM jenkins

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

USER root
ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

#switch to jenkins to customize
RUN apt-get update && apt-get install -y ruby nano sudo
RUN groupadd -g 125 docker && usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY ./plugins.txt /usr/share/jenkins/ref/
COPY ./executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

#switch to root to run
USER root
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["jenkins", "/bin/tini", "--", "/usr/local/bin/jenkins.sh"]