help:
	@echo 'Opciones:'
	@echo ''
	@echo 'windows-wsl / windows-hyperv / macos-intel / macos-m1'
	@echo 'stop / stop-all'
	@echo 'stats / logs'
	@echo 'clean'

_parche_wsl:
	@c:\windows\sysnative\wsl.exe -d docker-desktop sysctl -w vm.max_map_count=262144

_start:
	@docker-compose up -d

windows-wsl: _parche_wsl _start

windows-hyperv: _start

macos-intel: _start

macos-m1:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml up -d

macos-m1-build:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml build --pull

macos-m1-build-no-cache:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml build --no-cache --pull

stop:
	@docker-compose stop

stop-all:
	@docker stop `docker ps -aq`

stats:
	@docker stats

logs:
	@docker-compose logs sonarqube

clean:
	@docker-compose down -v --remove-orphans
