app_name := app
docker := docker
db := docker-compose exec app rake db:create db:migrate db:seed
compile := docker-compose exec app rails assets:precompile
run := docker-compose run 
prod := docker-compose -f prod.yml 
stop ?= (docker ps -aq)

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
	tail -f log/production.log
precompile:
	$(prod) exec app rails ENV_RAILS=production assets:precompile
tmp_clear:
	$(prod) exec app rails ENV_RAILS=production tmp:cache:clear
deploy:
	git checkout master
	git merge developer
	git push
	git checkout developer

clean: 
	docker rmi $(IMAGE_NAME):latest || true
	docker rmi $(IMAGE_NAME):$(TAG) || true