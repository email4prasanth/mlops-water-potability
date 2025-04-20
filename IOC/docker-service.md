- Go to folder 
```sh
sudo netstat -tulpn|grep LISTEN
git clone https://github.com/email4prasanth/mlops-water-potability.git
cd mlops-water-potability/water-potability/
ls -al
pwd
docker build -t service-web .
docker run -d -p 8000:8000 --name service-web-container service-web:latest

########### or 

cd
cd /app/service/
ls -al
sudo vi docker-compose.yml (update the context: path)
services:
  web:
    build:
      context: /home/ubuntu/mlops-water-potability/water-potability
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    networks:
      - shared_network
networks:
  shared_network:
    external: true

docker compose down -v
docker system prune -f
docker network create shared_network
docker compose up --build -d
docker ps
```
