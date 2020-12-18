docker := docker
db := docker-compose exec app rake db:create db:migrate db:seed
compile := docker-compose exec app rails assets:precompile
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
precompile:
	$(compile) 
install:
	$(db) 
	
	
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

clean: 
	docker rmi $(IMAGE_NAME):latest || true
	docker rmi $(IMAGE_NAME):$(TAG) || true