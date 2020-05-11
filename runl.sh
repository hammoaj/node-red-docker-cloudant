#!/bin/bash

# Build and run new image
docker container rm nr
# docker container run --name nr -p 1880:1880 node-red-cirrus:0.1
# docker container run --user 101010:0 --name nr -e "NODE_RED_STORAGE_URL=http://nr:nrpass@192.168.1.25:5984" -p 1880:1880 node-red-cirrus:0.1
echo "Running container..."
docker container run --env-file .envl --name nr -p 1880:1880 node-red-docker-cloudant:0.1