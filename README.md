# SonarQube

[SonarQube Code Quality and Code Security](https://www.sonarqube.org).

## Funcionamiento

1. Arrancar el servicio:

    - Windows: `make windows`.
    - macOS: `make macos`.

2. Acceder al [sitio web](http://localhost:9000).

3. Iniciar sesión con el usuario `admin/admin` y cambiar la contraseña cuando lo pida.

4. Crear un token y guardarlo para usarlo más adelante.

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
    -D sonar.projectKey=proyecto
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
    -D sonar.java.binaries=./target/classes/ \
    -D sonar.projectKey=proyecto
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
    -D sonar.exclusions='**/*.java' \
    -D sonar.projectKey=proyecto
```

## Integración con IntelliJ

[SonarQube IntelliJ Community Plugin](https://github.com/sonar-intellij-plugin/sonar-intellij-plugin)

## Referencias

- [Dockerfile](https://github.com/SonarSource/docker-sonarqube/tree/master/9/community) de la imagen de Docker oficial.
- [Fichero de Docker Compose](https://gist.github.com/Warchant/0d0f0104fe7adf3b310937d2db67b512) original.
