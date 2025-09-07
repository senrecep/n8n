# n8n with FFmpeg Dockerized Setup

This project provides a ready-to-use Docker Compose setup for running [n8n](https://n8n.io/) with FFmpeg support. It is designed for scalable, production-grade automation workflows, with environment-based configuration and multi-worker support.

## Features

- **n8n**: Powerful workflow automation tool
- **FFmpeg**: Installed for advanced media processing
- **Docker Compose**: Easy orchestration and scaling
- **Environment Variables**: Flexible configuration via `.env`
- **Multi-Worker Support**: Scale workers for high concurrency

## Project Structure

- `Dockerfile`: Extends the official n8n image and installs FFmpeg
- `docker-compose.yaml`: Defines services, environment, and scaling
- `install.sh`: Helper script to set up Docker network, volumes, and start services
- `.env`: Centralized environment configuration for n8n and related services

## Quick Start

1. **Clone the repository**
2. **Configure environment**
   - Edit `.env` to set ports, URLs, database, and other settings
3. **Run the install script**

   ```bash
   ./install.sh
   ```

   This will:

   - Create a Docker network and volume
   - Build the custom n8n image with FFmpeg
   - Start the services with Docker Compose

## Main Environment Variables

See `.env` for all options. Key variables:

- `N8N_PORT`: Port for n8n editor and API (default: 5678)
- `N8N_ENCRYPTION_KEY`: Set for secure credential encryption
- `GENERIC_TIMEZONE`/`TZ`: Set your timezone
- `DB_TYPE`, `DB_POSTGRESDB_*`: Configure PostgreSQL database
- `QUEUE_BULL_REDIS_*`: Configure Redis for queueing
- `N8N_RUNNERS_MAX_CONCURRENCY`, `N8N_WORKER_CONCURRENCY`: Control worker scaling

## Scaling Workers

To scale the number of n8n workers, adjust the `--scale n8n-worker=<count>` flag in `install.sh` or run:

```bash
docker compose up -d --scale n8n-worker=3
```

## Customization

- Add or change environment variables in `.env`
- Modify the `Dockerfile` to install additional dependencies

## Useful Commands

- Build images: `docker-compose build --no-cache`
- Start services: `docker compose up -d`
- Stop services: `docker compose down`

## License

This project is provided as-is for your automation needs. See [n8n.io](https://n8n.io/) for upstream licensing.
