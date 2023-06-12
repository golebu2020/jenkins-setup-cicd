#! /bin/bash

echo "Updating apt..."
apt update

echo "Installing docker and docker-compose..."
apt install docker.io

echo "Installing jenkins docker image and running it..."
docker run --name jenkins_01 -d -p 8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

echo "Fetching the container id"
jenkinscont1=docker ps -aqf jenkins_docker1
docker ps -qf name=nexus


echo "Log into the container as a root user"
docker exec -u 0 -it $jenkinscont1 sh

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


echo "Stop the container from running"

jenkinscont1=docker ps -aqf jenkins_docker1
docker stop $jenkinscont1

docker run --name jenkins_docker2 -d -p 8080:8080 -p 50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker jenkins/jenkins:lts

jenkinscont2=docker ps -aqf jenkins_docker2
echo "log into the container as a root user..."
docker exec -it -u 0 $jenkinscont2 bash

curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall

echo "adding read-write permission for the file docker.sock"
chmod 666 /var/run/docker.sock

echo "logout and signin as a jenkins user"
exit
docker exec -it $jenkinscont2 bash

echo "try to install redis container to test"
docker pull redis

echo "redis has been installed!"


