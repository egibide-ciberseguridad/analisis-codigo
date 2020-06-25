# Ciberseguridad

## Herramientas

- [SonarQube](https://docs.sonarqube.org/latest/setup/get-started-2-minutes/)
- [SonarScanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
- [Damn Vulnerable Web Application](http://www.dvwa.co.uk)
- [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/)
- [Descompilar aplicaciones Android](https://medium.com/@alvareztech/descompilar-aplicaciones-android-8e7519732f23)

## SonarQube

Arrancar el servicio con `docker-compose up -d` y acceder al [sitio web](http://localhost:9000).

Usuario `admin/admin`.

## SonarScanner

Lanzar SonarScanner con [Docker](https://github.com/newtmitch/docker-sonar-scanner).

```bash
docker run -ti -v $(pwd):/usr/src --link sonarqube --network ciberseguridad_sonarnet newtmitch/sonar-scanner:alpine \
  -Dsonar.projectKey=MyProjectKey \
  -Dsonar.projectName="My Project Name" \
  -Dsonar.projectVersion=1
```

## OWASP Dependency-Check

```bash
owasp-dependency.sh
```

El informe se genera en `odc-reports/dependency-check-report.html`.

## Análisis de un APK

- Renombrar a .zip y descomprimir.
- Convertir de dex a jar con dex2jar.

    ```bash
    brew install dex2jar
    d2j-dex2jar classes.dex
    ```

- Abrir el jar con [JD_GUI](http://java-decompiler.github.io).
- Descomprimir el jar para conseguir los .class.
- Fusionar las dos carpetas para tener los .class y los .java juntos.

    ```bash
    docker run -ti -v $(pwd):/usr/src --link sonarqube --network ciberseguridad_sonarnet newtmitch/sonar-scanner:alpine \
      -Dsonar.java.binaries=/usr/src \
      -Dsonar.projectKey=MyProjectKey \
      -Dsonar.projectName="My Project Name" \
      -Dsonar.projectVersion=1
    ```

## Analizar código Kotlin

```bash
    docker run -ti -v $(pwd):/usr/src --link sonarqube --network ciberseguridad_sonarnet newtmitch/sonar-scanner:alpine \
      -Dsonar.exclusions='**/*.java' \
      -Dsonar.projectKey=MyProjectKey \
      -Dsonar.projectName="My Project Name" \
      -Dsonar.projectVersion=1
```
