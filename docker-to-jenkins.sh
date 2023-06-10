echo "Leave the shell mode"
exit
exit
echo "stop the currently running container and attach a volume to jenkins"

echo "Fetching the container id"
jenkins_container_id=docker ps -a -q

docker stop $jenkins_container_id

docker run -dp8080:8080 -p50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker  jenkins/jenkins:lts

docker ps

echo "log into the container as a root user..."
docker exec -itu0 jenkins_container_id bash

echo "adding read-write permission for the file docker.sock"
chmod 666 /var/run/docker.sock

echo "logout and signin as a root user"

