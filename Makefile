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
	@echo -----------------------
	@echo start / stop / stop-all
	@echo stats / logs
	@echo clean
	@echo -----------------------

_header:
	@echo ---------
	@echo SonarQube
	@echo ---------

start:
	@docker compose up -d sonarqube

stop:
	@docker compose stop

stop-all:
	@docker stop $(shell docker ps -aq)

stats:
	@docker stats

logs:
	@docker compose logs sonarqube

clean:
	@docker compose down -v --remove-orphans

_urls: _header
	${info }
	@echo ---------------------------------
	@echo [SonarQube] http://localhost:9000
	@echo ---------------------------------
