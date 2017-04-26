FROM cptactionhank/atlassian-jira:latest

MAINTAINER Alejandro Sosa <alesjohnson@hotmail.com>

USER root
RUN chmod -R 700 "${JIRA_HOME}/caches/"

VOLUME ["/var/atlassian/jira", "/opt/atlassian/jira/logs"]

EXPOSE 8080