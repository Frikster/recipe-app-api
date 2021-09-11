# Run every line in a common shell
.ONESHELL:
SHELL=/bin/bash

test:
	docker-compose run --rm app sh -c "python manage.py test && flake8"

migrate:
	docker-compose run app sh -c "python manage.py makemigrations core"

build:
	docker-compose build

run:
	docker-compose up

create-superuser:
	docker-compose run app sh -c "python manage.py createsuperuser"

.ONESHELL:
create-django-app:
	@read -p "Enter new app name: " name
	docker-compose run app sh -c "python manage.py startapp $${name}"

kill:
	docker kill $$(docker ps -q)
