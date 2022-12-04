help:
	@echo "---------"
	@echo "SonarQube"
	@echo "---------"
	@echo "Opciones:"
	@echo ""
	@echo "windows-wsl / windows-hyperv / macos-intel / macos-m1"
	@echo "stop / stop-all"
	@echo "stats / logs"
	@echo "clean"

_parche_wsl:
	@c:\windows\sysnative\wsl.exe -d docker-desktop sysctl -w vm.max_map_count=262144

_start:
	@docker-compose up -d

windows-wsl: _parche_wsl _start _urls

windows-hyperv: _start _urls

macos-intel: _start _urls

macos-m1:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml up -d
	@$(MAKE) _urls

macos-m1-build-sonarqube:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml build --pull sonarqube

macos-m1-build-sonarqube-no-cache:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml build --no-cache --pull sonarqube

macos-m1-build-scanner:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml build --pull sonar-scanner-cli

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

_urls:
	@echo ""
	@echo "---------------------------------"
	@echo "[SonarQube] http://localhost:9000"
	@echo "---------------------------------"
