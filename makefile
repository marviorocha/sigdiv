app :=arquivo
web :=
db :=txt
run := docker-compose run 
prod := docker-compose -f prod.yml 
stop ?= (docker ps -aq)
 
build:
	$(prod) build
server:
	$(prod) up -d
down:
	$(prod) down
restart:
	$(prod) restart
bash:
	$(prod) run app /bin/sh
uninstall:
	docker stop ($(stop)) 
logs:
	tail -f log/production.log
 