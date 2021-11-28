#!/usr/bin/env bash

# https://newbedev.com/how-to-execute-scripts-after-docker-compose-up
if [ ! -f .initialized ]; then
  echo "bootstrap.seccomp: false" >>/opt/sonarqube/elasticsearch/config/elasticsearch.yml
  echo "bootstrap.system_call_filter: false" >>/opt/sonarqube/elasticsearch/config/elasticsearch.yml
  touch .initialized
fi

exec java -jar lib/sonar-application-"${SONAR_VERSION}".jar -Dsonar.log.console=true "$@"
