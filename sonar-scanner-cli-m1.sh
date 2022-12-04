#!/usr/bin/env sh

docker-compose -f docker-compose.yml -f docker-compose.arm64.yml run \
  --rm \
  -e SONAR_HOST_URL="http://sonarqube:9000" \
  -e SONAR_LOGIN="$1" \
  -v "$2:/usr/src" \
  sonar-scanner-cli \
  -D sonar.projectKey="$3"
