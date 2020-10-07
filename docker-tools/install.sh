docker-compose build db
docker-compose build app
docker-compose build es
docker-compose run app rake db:create db:migrate db:seed
docker-compose up -d
