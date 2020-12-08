docker := docker
db := rake db:create db:migrate db:seed
run := docker-compose run 
prod := docker-compose -f prod.yml
development := docker-compose
stop ?= (docker ps -aq)

## Docker commands ##

prune:
	$(docker) system prune

## Developer Envaroments ##
build:
	$(development) build
server:
	$(development) up
up:
	$(development) up -d
down:
	$(development) down
restart:
	$(development) restart
bash:
	$(development) run app /bin/sh
install:
	$(db)
	exit
logs:
	tail -f log/development.log

## Production Envaroments ##

production:
	$(prod) up -d
production-up:
	$(prod) up -d
production-dash:
	$(prod) run app /bin/sh
production-build:
	$(prod) build
production-server:
	$(prod) up
production-down:
	$(prod) down
production-restart:
	$(prod) restart
production-bash:
	$(prod) run app /bin/sh
production-logs:
	tail -f log/production.log

deploy:
	git checkout master
	git merge developer
	git push
	git checkout developer