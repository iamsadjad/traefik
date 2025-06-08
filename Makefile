.PHONY: up down restart logs status ps certs clean nginx syslog logrotate all

# Start containers in detached mode
up:
	@docker compose up -d

# Stop and remove containers
down:
	@docker compose --profile nginx --profile syslog --profile logrotate down

# Restart containers
restart:
	@docker compose --profile nginx --profile syslog --profile logrotate down
	@docker compose up -d

# View container logs
logs:
	@docker compose logs -f

# Show status of containers
status:
	@docker compose ps

# Alias for status
ps: status

# Generate self-signed certs
certs:
	@mkdir -p certs
	@openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout ./certs/private.key \
		-out ./certs/ca.cert \
		-subj "/CN=localhost"

# Clean up containers and generated files
clean:
	@docker compose down -v --remove-orphans
	@rm -rf ./logs/* ./letsencrypt/* ./certs/*

# Start nginx profile
nginx:
	@docker compose --profile nginx up -d

# Start syslog profile
syslog:
	@docker compose --profile syslog up -d

# Start logrotate profile
logrotate:
	@docker compose --profile logrotate up -d

# Start all profiles
all:
	@docker compose \
		--profile nginx \
		--profile syslog \
		--profile logrotate up -d
