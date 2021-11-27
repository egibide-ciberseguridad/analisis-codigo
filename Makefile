help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | stats | clean'
	@echo 'windows'

start:
	@docker-compose up -d

stop:
	@docker-compose stop

stats:
	@docker stats

clean:
	@docker-compose down -v --remove-orphans

windows:
	@c:\windows\sysnative\wsl.exe -d docker-desktop sysctl -w vm.max_map_count=262144
