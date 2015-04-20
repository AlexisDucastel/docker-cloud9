Cloud9 v3 Dockerfile
=============

This repository contains Dockerfile of Cloud9 IDE for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[kdelfour/supervisor-docker](https://registry.hub.docker.com/u/kdelfour/supervisor-docker/)

# Installation

## Install Docker.

Download automated build from public Docker Hub Registry: docker pull hansd/cloud9

(alternatively, you can build an image from Dockerfile: docker build -t="hansd/cloud9" github.com/hans-d/docker-cloud9)

## Usage

    docker run -it -d -p 8181:8181 -e USER=user -e PASS=secret hansd/cloud9
    
You can add a workspace as a volume directory with the argument *-v /your-path/workspace/:/workspace/* like this :

    docker run -it -d -p 8181:8181 -v /your-path/workspace/:/workspace/ -e USER=user -e PASS=secret hansd/cloud9
    
## Build and run with custom config directory

Get the latest version from github

    git clone https://github.com/hans-d/docker-cloud9
    cd docker-cloud9/

Build it

    docker build --force-rm=true --tag="$USER/cloud9:latest" .
    
And run

    docker run -it -d -p 8181:8181 -v /your-path/workspace/:/workspace/ -e USER=user -e PASS=secret $USER/cloud9

Enjoy !!    
