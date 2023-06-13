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
    docker run --name jenkins2 -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

#### Log into the Container as a Root User
    docker exec -it -u 0 jenkins2 sh

#### Install Docker in the Container
    curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall

#### Adding Read-Write Permission for the File docker.sock
    chmod 666 /var/run/docker.sock

#### Logout and Sign In as a Jenkins User
    exit
    
#### LogIn as a Regular User
    docker exec -it jenkins2 sh

#### Testing by Installing Redis as an Image
    docker pull redis
    
#### Exit from the Container
    exit
    
#### Installing Nexus
    docker volume create --name nexus-data && docker run -d -p 8081:8081 -p 8082:8082 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

#### Create the daemon.json file in /etc/docker/daemon.json
    touch /etc/docker/daemon.json
    
#### Edit the Server Ip Address
    echo "{'Insecure-registries': ['server_ip_address:8082']}" > /etc/docker/daemon.json

#### Stop Docker Container and Start Docker Containaer
    systemctl restart docker && docker start nexus jenkins2


