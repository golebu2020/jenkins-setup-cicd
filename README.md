## Installing Jenkins and Nexus on a Remote Server for CI/CD
#### 1. Update apt
    apt update

#### 2. Install Docker"
    apt install docker.io

#### 3. Installing and Run Jenkins Container"
    docker run --name jenkins1 -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

#### 4. Log into the Container as Root User
    docker exec -u 0 -it jenkins1 sh

#### 5. Verify the Linux Distribution"
    cat /etc/issue

#### 6. Update Apt
    apt update

#### 7. Install Curl
    apt install curl

#### 8. Download Script for Installing nodejs and npm"
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh

#### 9. Execute the Shell Script
    bash nodesource_setup.sh

#### 10. Install nodejs
    apt install nodejs && apt install npm

#### 11. Verify Installation
    nodejs -v
    npm -v

#### 12. Logout of the Shell"
    exit
    
#### 13. Stop the Container
    docker stop jenkins1

#### 14. Reinstall Jenkins Container
    docker run --name jenkins2 -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

#### 15. Log into the Container as a Root User
    docker exec -it -u 0 jenkins2 sh

#### 16. Install Docker in the Container
    curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall

#### 17. Adding Read-Write Permission for the File docker.sock
    chmod 666 /var/run/docker.sock

#### 18. Logout and Sign In as a Jenkins User
    exit
    
#### 19. LogIn as a Regular User
    docker exec -it jenkins2 sh

#### 20. Testing by Installing Redis as an Image
    docker pull redis
    
#### 21. Exit from the Container
    exit
    
#### 22. Installing Nexus
    docker volume create --name nexus-data && docker run -d -p 8081:8081 -p 8082:8082 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

#### 23. Create the daemon.json file in /etc/docker/daemon.json
    touch /etc/docker/daemon.json
    
#### 24. Edit the Server Ip Address
    echo "{'Insecure-registries': ['server_ip_address:8082']}" > /etc/docker/daemon.json

#### 25. Stop Docker Container
    systemctl restart docker 
    
#### 26. Check the Updated Registried on Docker
    docker info
    
#### 27. Restart Docker and Nexu
    docker start nexus jenkins2


