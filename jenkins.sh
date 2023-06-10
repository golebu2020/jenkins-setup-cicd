#! /bin/bash

echo "Updating apt..."
apt update

echo "Installing docker and docker-compose..."
apt install docker docker-compose

echo "Installing jenkins docker image and running it..."
docker run -dp8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

echo "Fetching the container id"
jenkins_container_id=docker ps -a -q

echo "Log into the container as a root user"
docker exec -it -u 0 $jenkins_container_id sh

echo "Verify the Linux Distribution"
cat /etc/issue

echo "update apt"
apt update

echo "install curl..."
apt install curl

echo "download script for installing nodejs and npm"
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
ls

echo "Execute the script"
bash nodesource_setup.sh

echo "Install nodejs..."
apt install nodejs
apt install npm

nodejs -v
npm -v

echo "You're logged in as a root user"

echo "Leave the shell mode"
exit

echo "Fetching the container id"
jenkins_container_id=docker ps -a -q

echo "Stop the container from running"

docker stop $jenkins_container_id

docker run -dp8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker  jenkins/jenkins:lts

docker ps

echo "log into the container as a root user..."
docker exec -itu0 jenkins_container_id bash

curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall

echo "adding read-write permission for the file docker.sock"
chmod 666 /var/run/docker.sock

echo "logout and signin as a root user"
docker exec -it jenkins_container_id bash

echo "try to install redis container to test"
docker pull redis

echo "redis has been installed!"


