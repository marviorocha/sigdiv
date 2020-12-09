app_name := app
docker := docker
db := rake db:create db:migrate db:seed
run := docker-compose run 
prod := docker-compose -f prod.yml 
stop ?= (docker ps -aq)
IMAGE_NAME := panubo/$(NAME)
## Docker commands ##

prune:
	$(docker) system prune

## Developer Envaroments ##
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
	tail -f log/development.log

deploy:
	git checkout master
	git merge developer
	git push
	git checkout developer

clean: 
	docker rmi $(IMAGE_NAME):latest || true
	docker rmi $(IMAGE_NAME):$(TAG) || true