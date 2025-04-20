- Go to folder 
```sh
sudo netstat -tulpn|grep LISTEN
git clone https://github.com/email4prasanth/mlops-water-potability.git
cd mlops-water-potability/water-potability/
ls -al
pwd
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
              - "5000:5000"
            networks:
              - shared_network

        networks:
          shared_network:
            external: true


docker compose up --build
docker-compose up -d
# docker compose up --build -d
docker compose down -v
docker system prune -f
docker compose up --build -d
```
