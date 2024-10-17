#!/usr/bin/env sh

if [ $# -lt 3 ]; then
  echo ''
  echo 'Uso:  sonar-scanner-cli.sh TOKEN RUTA_PROYECTO NOMBRE_PROYECTO'
  echo ''
  exit 1
fi

docker run \
  --platform=linux/amd64 \
  --rm \
  --network sonarqube_sonarnet \
  -e SONAR_HOST_URL="http://sonarqube:9000" \
  -v "$2:/usr/src" \
  sonarsource/sonar-scanner-cli \
  -D sonar.token="$1" \
  -D sonar.projectKey="$3"
