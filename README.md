# Traefik
Modern HTTP reverse proxy and load balancer integrates with Docker infrastructure

## Features
Continuously updates its configuration (No restarts!)
Supports multiple load balancing algorithms
Provides HTTPS to your microservices by leveraging Let's Encrypt (wildcard certificates support)
Circuit breakers, retry
See the magic through its clean web UI
WebSocket, HTTP/2, gRPC ready
Provides metrics (Rest, Prometheus, Datadog, Statsd, InfluxDB 2.X)
Keeps access logs (JSON, CLF)
Fast
Exposes a Rest API
Packaged as a single binary file (made with ❤️ with go) and available as an official docker image

## Getting started

## Quick Start

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed

### Installation & Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/iamsadjad/traefik.git
   cd traefik
   ```

2. **Start all services:**
   ```sh
   make up
   ```

3. **Check status:**
   ```sh
   make status
   ```

4. **View logs:**
   ```sh
   make logs
   ```

5. **Stop all services:**
   ```sh
   make down
   ```

6. **Restart services:**
   ```sh
   make restart
   ```

7. **Clean up (remove volumes, logs, certs):**
   ```sh
   make clean
   ```

### Optional: Run Specific Profiles

- Start Nginx + Treafik:
  ```sh
  make nginx
  ```
- Start Syslog + Treafik:
  ```sh
  make syslog
  ```
- Start Logrotate + Treafik:
  ```sh
  make logrotate
  ```
- **Start all optional services (Treafik, Nginx, Syslog, Logrotate) together:**
  ```sh
  make all
  ```

### Self-signed Certificate (for development)

Generate a self-signed certificate:
```sh
make certs
```

---

## Configuration

- Edit `docker-compose.yml` to customize services.
- Place your Traefik dynamic configs in `conf.d/`.
- Place your Nginx configs in `nginx/conf.d/` and web files in `nginx/www/`.

---

## Troubleshooting

- Check logs with `make logs`.
- Ensure Docker volumes and permissions are correct.
- For Let's Encrypt issues, check the `letsencrypt/` directory.

---

### Default Traefik Dashboard Access

The Traefik dashboard is protected with basic authentication by default:

- **Username:** `user`
- **Password:** `password`

You can change these credentials in `conf.d/_middleware.yml` under the `auth` middleware section.

---

## License

MIT


