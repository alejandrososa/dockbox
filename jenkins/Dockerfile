FROM jenkins

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

ENV TERM xterm

USER root
RUN mkdir -p /var/log/jenkins
RUN mkdir -p /var/cache/jenkins
RUN chown -R  jenkins:jenkins /var/log/jenkins
RUN chown -R  jenkins:jenkins /var/cache/jenkins

#switch to jenkins to customize
RUN apt-get update && apt-get install -y ruby nano sudo
RUN groupadd -g 125 docker && usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY ./plugins.txt /usr/share/jenkins/ref/
COPY ./executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"