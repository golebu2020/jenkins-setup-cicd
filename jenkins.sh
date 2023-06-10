#! /bin/bash

echo "Updating apt..."
apt update

echo "Install git.."
apt install git

git clone https://github.com/golebu2020/jenkins-setup-cicd
cd jenkins-setup-cicd
mv jenskins.sh ~

echo "Installing docker and docker-compose..."
apt install docker docker-compose

echo "Installing jenkins docker image and running it..."
docker run -dp8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

echo "Fetching the container id"
jenkins_container_id=docker ps -a -q

echo "Log into the container as a root user"
docker exec -u 0 -it $jenkins_container_id sh

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

