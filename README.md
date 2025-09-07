# n8n with FFmpeg Dockerized Setup

This project provides a ready-to-use Docker Compose setup for running [n8n](https://n8n.io/) with FFmpeg support. It is designed for scalable, production-grade automation workflows, with environment-based configuration and multi-worker support. The setup now uses a prebuilt public Docker image from Docker Hub: [`recepsen/n8n-ffmpeg`](https://hub.docker.com/r/recepsen/n8n-ffmpeg).

## Features

- **n8n**: Powerful workflow automation tool
- **FFmpeg**: Installed for advanced media processing
- **Docker Compose**: Easy orchestration and scaling
- **Environment Variables**: Flexible configuration via `.env`
- **Multi-Worker Support**: Scale workers for high concurrency

## Project Structure

- `docker-compose.yaml`: Defines services, environment, and scaling (uses `recepsen/n8n-ffmpeg` image)
- `.env`: Centralized environment configuration for n8n and related services
- `install.sh`: Helper script to set up Docker network, volumes, and start services
- `Dockerfile`: (Optional) If you want to build your own custom image

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
   - Start the services with Docker Compose using the public image `recepsen/n8n-ffmpeg`

**Optional: Build your own image**

If you want to customize the image (e.g., add more dependencies), edit the `Dockerfile` and build/push your own image. Then update `docker-compose.yaml` to use your image name.

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

- Start services: `docker compose up -d`
- Stop services: `docker compose down`
- (Optional) Build images: `docker-compose build --no-cache` (only if you want to build locally)

## License

This project is provided as-is for your automation needs. See [n8n.io](https://n8n.io/) for upstream licensing.
