#!/bin/sh
# remove previous images and containers
docker rm -f ci
docker rmi -f myolnir/docker-continuous-integration

# build and run the container
docker build --tag="myolnir/docker-continuous-integration" .
docker run -d \
	-p 8888:8080 \
	-p 9000:9000 \
	-p 9092:9092 \
	--name="ci" myolnir/docker-continuous-integration

# attach to it
#docker exec -i -t ci /bin/bash