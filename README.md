## Use the following steps to setup Jenkins on a live server:
#### Update apt
    apt update
    
#### Install git
    apt install git 
    
#### Clone the repo
    git clone https://github.com/golebu2020/jenkins-setup-cicd 

#### Copy jenkins to the home directory
    mv jenkins-setup-cicd/jenkins.sh ~
#### 5.) mv jenkins-setup-cicd/docker-to-jenkins.sh ~
#### 6.) bash jenkins.sh
#### 7.) bash docker-to-jenkins.sh
