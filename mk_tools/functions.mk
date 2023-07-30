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
