docker network create -d bridge n8n-network
docker volume create n8n_data

docker pull n8nio/n8n

docker-compose build --no-cache

docker compose up -d --scale n8n-worker=3