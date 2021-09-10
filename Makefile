# Run every line in a common shell
.ONESHELL:
SHELL=/bin/bash

test:
	docker-compose run app sh -c "python manage.py test && flake8"

migrate:
	docker-compose run app sh -c "python manage.py makemigrations core"