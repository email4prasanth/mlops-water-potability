touch setup.sh
sudo chmod +x setup.sh
sudo vi setup.sh

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl net-tools -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker run hello-world
sudo docker images
sudo usermod -aG docker ubuntu
docker network create shared_network

## Pyhton and pip installation
sudo apt install python3-pip -y

# create service and store docker compose file
sudo mkdir -p /app/service
sudo chmod -R 755 /app/service/

sudo su -




# Test on Server
sudo su ubuntu
cd
docker images
docker ps -aq
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -aq)
docker ps -aq
docker images
pip3 --version
docker --version
docker compose version
sudo systemctl enable docker
sudo systemctl status docker


cd /app/service/
vi docker-compose.yml

# Once updated, run:
docker compose up -d
cd /app/service/




