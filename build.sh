#!/bin/bash

# Stop local container
docker container rm nr

# Remove image
docker image rm node-red-docker-cloudant:0.1

# Build new image
docker build -t node-red-docker-cloudant:0.1 .
