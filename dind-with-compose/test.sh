#!/usr/bin/env sh

# after docker-compose up
# docker exec -t docker-auto-network \
#     docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true cheshirecode/dind-with-compose \
#     docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true cheshirecode/dind-with-compose \
#     docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true cheshirecode/dind-with-compose \
#     docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true cheshirecode/dind-with-compose

docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true docker:dind \
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true docker:dind \
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true docker:dind \
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true docker:dind docker