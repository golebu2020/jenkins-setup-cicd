#! /bin/bash

#### Update apt
    apt update

#### Install Docker"
    apt install docker.io

#### Installing and Run Jenkins Container"
    docker run --name jenkins1 -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

#### Log into the Container as Root User
    docker exec -u 0 -it jenkins1 sh

#### Verify the Linux Distribution"
    cat /etc/issue

#### Update Apt
    apt update

#### Install Curl
    apt install curl

#### Download Script for Installing nodejs and npm"
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh

#### Execute the Shell Script
    bash nodesource_setup.sh

#### Install nodejs
    apt install nodejs && apt install npm

#### Verify Installation
    nodejs -v
    npm -v

#### Logout of the Shell"
    exit
    
#### Stop the Container
    docker stop jenkins1

#### Reinstall Jenkins Container
    docker run --name jenkins_docker2 -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

#### Log into the Container as a Root User
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

