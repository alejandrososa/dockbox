FROM jenkins

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

USER root
RUN apt-get update && apt-get install -y ruby
RUN groupadd -g 125 docker && usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
COPY plugins.txt /usr/share/jenkins/plugins.txt
COPY ./executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy