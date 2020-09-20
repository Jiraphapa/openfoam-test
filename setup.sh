 #! /bin/sh

# Install Docker
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

# Config docker in order to run as non-root user 
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

docker run hello-world

# Pull docker image
docker pull openfoamplus/of_v2006_centos73

curl -L raw.githubusercontent.com/Jiraphapa/openfoam-test/master/runOpenFOAM.sh > runOpenFOAM.sh
mkdir test

# Create an OpenFOAM Container and run some test command
sudo chmod +x runOpenFOAM.sh
./runOpenFOAM.sh