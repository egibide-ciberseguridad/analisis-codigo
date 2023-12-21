# SonarQube

[SonarQube Code Quality and Code Security](https://www.sonarsource.com/products/sonarqube/).

## Funcionamiento

1. Arrancar el servicio:

   ```
   make start
   ```

2. Acceder al [sitio web](http://localhost:9000).

3. Iniciar sesión con el usuario `admin/admin` y cambiar la contraseña cuando lo pida.

4. [Crear un token](http://localhost:9000/account/security) de acceso y guardarlo para usarlo más adelante.

## SonarScanner

Lanzar el script de escaneado correspondiente a la plataforma y tipo de proyecto que se vaya a escanear:

En Linux y macOS:

```
sonar-scanner-cli.sh TOKEN RUTA_PROYECTO NOMBRE_PROYECTO
```

En Windows:

```
sonar-scanner-cli.bat TOKEN RUTA_PROYECTO NOMBRE_PROYECTO
```

> La ruta al proyecto tiene que ser absoluta.

## Integración con IntelliJ

[SonarQube IntelliJ Community Plugin](https://github.com/sonar-intellij-plugin/sonar-intellij-plugin)

## Referencias

- [Dockerfile](https://github.com/SonarSource/docker-sonarqube/tree/master/9/community) de la imagen de Docker oficial.
- [Fichero de Docker Compose](https://gist.github.com/Warchant/0d0f0104fe7adf3b310937d2db67b512) original.
- [Dockerfile](https://github.com/SonarSource/sonar-scanner-cli-docker/tree/master/4) original de la imagen del scanner.
