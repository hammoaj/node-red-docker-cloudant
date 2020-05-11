#!/bin/bash

# Stop local container
docker container rm nr

# Remove image
docker image rm node-red-cirrus:0.1

# Build new image
docker build -t node-red-cirrus:0.1 .
