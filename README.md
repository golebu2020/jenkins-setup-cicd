# jenkins-setup-cicd
## On the server, clone the project and access the file to setup jenkins on the server
apt update
apt install git
git clone https://github.com/golebu2020/jenkins-setup-cicd 

<br />
mv jenkins-setup-cicd/jenkins.sh ~
mv docker-to-jenkins.sh ~
<br />
bash jenkins.sh
<br/>
bash docker-to-jenkins.sh
