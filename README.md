# Ciberseguridad

## SonarScanner

Lanzar SonarScanner con [Docker](https://github.com/newtmitch/docker-sonar-scanner).

```bash
docker run -ti -v $(pwd):/usr/src --link sonarqube --network ciberseguridad_sonarnet newtmitch/sonar-scanner:alpine \
  -Dsonar.projectKey=MyProjectKey \
  -Dsonar.projectName="My Project Name" \
  -Dsonar.projectVersion=1
```
