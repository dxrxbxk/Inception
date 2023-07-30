include mk_tools/functions.mk

all: mdir build detach

start: stop
	docker compose --file ./srcs/docker-compose.yml up

detach: stop
	docker compose --file ./srcs/docker-compose.yml up --detach

build:
	docker compose --file ./srcs/docker-compose.yml build

stop:
	docker compose --file ./srcs/docker-compose.yml down

mdir:
	$(call check_file_existence,/home/diroyer/data/DB/,777)
	$(call check_file_existence,/home/diroyer/data/WordPress/,777)

clean: stop
	docker system prune -af
	docker volume prune -af
	docker volume rm $$(docker volume ls -q)

fclean: clean
	sudo rm -rf /home/diroyer/data/WordPress
	sudo rm -rf /home/diroyer/data/DB
