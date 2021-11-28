help:
	@echo 'Opciones:'
	@echo ''
	@echo 'windows | macos'
	@echo 'stop | stats | clean'

windows:
	@c:\windows\sysnative\wsl.exe -d docker-desktop sysctl -w vm.max_map_count=262144
	@docker-compose up -d

macos:
	@docker-compose -f docker-compose.yml -f docker-compose.arm64.yml up -d

stop:
	@docker-compose stop

stats:
	@docker stats

clean:
	@docker-compose down -v --remove-orphans
