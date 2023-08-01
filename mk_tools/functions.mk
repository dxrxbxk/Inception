define check_file_existence
	@if [ -e "$(1)" ]; then \
		echo "'$(1)' already exist"; \
	else \
		mkdir -vp '$(1)'; \
		if [ "$(2)" ]; then \
			sudo chmod -R '$(2)' '$(1)'; \
		fi \
	fi
endef

define clean_volumes
    @volumes=$$(docker volume ls -q); \
    if [ -n "$$volumes" ]; then \
        for volume in $$volumes; do \
            docker volume rm "$$volume"; \
        done; \
    fi

endef

define wait_for_fpm
	@tmpfile=$$(mktemp); \
	docker logs -f wordpress > $$tmpfile & \
	docker_logs_pid=$$!; \
	while ! grep -q "Lauching PHP-FPM..." $$tmpfile; do \
		sleep 1; \
	done; \
	kill "$$docker_logs_pid";
endef
