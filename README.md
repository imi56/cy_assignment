# README

* System dependencies
  Docker version 19.03.5

* Deployment instructions
  docker-compose build
  docker-compose up

* Database initialization
  Create DB extension
  * Step 1: From host connet to db container. => docker exec -it db_container /bin/bash
  * Step 2: Login to postgres db to create extension. => psql postgres -U postgres
  * Step 3: Create extension. => create extension hstore;
  * Step 4: Exit from db => \q
  * Step 5: Exit from container. => exit

* Database migraiton
  docker-compose run --rm app bundle exec rake db:migrate
* Rails console
  docker exec -it app_container bin/rails c

