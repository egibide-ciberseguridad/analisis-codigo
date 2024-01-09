#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo -------------------
	@echo start / start-linux
	@echo stop / stop-all
	@echo stats / logs
	@echo update
	@echo clean
	@echo -------------------

_urls: _header
	${info }
	@echo ---------------------------------
	@echo [SonarQube] http://localhost:9000
	@echo ---------------------------------

_header:
	@echo ---------
	@echo SonarQube
	@echo ---------

_start_command:
	@docker compose up -d sonarqube

start: _start_command _urls

_parche_linux:
	@echo "Este script necesita permisos de administrador para continuar"
	@sudo sysctl -w vm.max_map_count=262144

start-linux: _parche_linux _start_command _urls

stop:
	@docker compose stop

stop-all:
	@docker stop $(shell docker ps -aq)

stats:
	@docker stats

logs:
	@docker compose logs sonarqube

update:
	@docker compose pull
	@docker pull sonarsource/sonar-scanner-cli

clean:
	@docker compose down -v --remove-orphans
