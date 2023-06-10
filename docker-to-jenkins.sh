echo "stop the currently running container and attach a volume to jenkins"
docker run -dp8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker  jenkins/jenkins:lts

