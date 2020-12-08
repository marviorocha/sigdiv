docker := docker
db := rake db:create db:migrate db:seed
run := docker-compose run 
prod := docker-compose -f prod.yml
development := docker-compose
stop ?= (docker ps -aq)
 
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
prune:
	$(docker) system prune
production:
	$(prod) up -d
deploy:
	git checkout master
	git merge developer
	git push
	git checkout developer