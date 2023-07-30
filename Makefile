include mk_tools/functions.mk

all: mdir
	docker compose --file srcs/docker-compose.yml up -d --build

stop:
	docker compose --file srcs/docker-compose.yml down

mdir:
	$(call check_file_existence,/home/diroyer/data/DB/,777)
	$(call check_file_existence,/home/diroyer/data/WordPress/,777)

clean:
	docker system prune -af
