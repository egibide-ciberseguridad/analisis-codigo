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
	@echo --------------------------------------------
	@echo windows-wsl / windows-hyperv / linux / macos
	@echo stop / stop-all
	@echo stats / logs
	@echo clean
	@echo --------------------------------------------

_header:
	@echo ---------
	@echo SonarQube
	@echo ---------

_parche_wsl:
	@c:\windows\sysnative\wsl.exe -d docker-desktop sysctl -w vm.max_map_count=262144

_start:
	@docker compose up -d sonarqube

windows-wsl: _parche_wsl _start _urls

windows-hyperv: _start _urls

_parche_linux:
	@echo "Este script necesita permisos de administrador para continuar"
	@sudo sysctl -w vm.max_map_count=262144

linux: _parche_linux _start _urls

macos: _start _urls

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
