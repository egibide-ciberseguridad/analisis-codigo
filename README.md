# SonarQube

[SonarQube Code Quality and Code Security](https://www.sonarqube.org).

## Funcionamiento

Arrancar el servicio con `docker-compose up -d` y acceder al [sitio web](http://localhost:9000).

Usuario `admin/admin`.

Crear un token y guardarlo para usarlo más adelante.

## SonarScanner

Lanzar SonarScanner con [Docker](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/) en la carpeta que
contenga el código a analizar:

```bash
docker run \
    --rm \
    --link sonarqube --network ciberseguridad_sonarnet \
    -e SONAR_HOST_URL="http://sonarqube:9000" \
    -e SONAR_LOGIN="c90cff9a40c4284a2dca7021860ff991f3bd526c" \
    -v "$(pwd):/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.projectKey=proyecto
```

> El valor de SONAR_LOGIN es el del token creado al instalar SonarQube.

> :book: [Parámetros de análisis](https://docs.sonarqube.org/latest/analysis/analysis-parameters/)
> :book: [Lenguajes soportados](https://docs.sonarqube.org/latest/analysis/languages/overview/)

## Analizar código Java

```bash
docker run \
    --rm \
    --link sonarqube --network ciberseguridad_sonarnet \
    -e SONAR_HOST_URL="http://sonarqube:9000" \
    -e SONAR_LOGIN="c90cff9a40c4284a2dca7021860ff991f3bd526c" \
    -v "$(pwd):/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.java.binaries=./target/classes/ \
    -Dsonar.projectKey=proyecto
```

## Analizar código Kotlin

```bash
docker run \
    --rm \
    --link sonarqube --network ciberseguridad_sonarnet \
    -e SONAR_HOST_URL="http://sonarqube:9000" \
    -e SONAR_LOGIN="c90cff9a40c4284a2dca7021860ff991f3bd526c" \
    -v "$(pwd):/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.exclusions='**/*.java' \
    -Dsonar.projectKey=proyecto
```

## Integración con IntelliJ

[SonarQube IntelliJ Community Plugin](https://github.com/sonar-intellij-plugin/sonar-intellij-plugin)
