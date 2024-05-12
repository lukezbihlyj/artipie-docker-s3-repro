#!/bin/bash

docker run --rm -it \
    -p 8080:8080 \
    -p 8083:8083 \
    -v ./artipie.yaml:/etc/artipie/artipie.yml \
    -v ./repo:/var/artipie/repo \
    -v ./security:/var/artipie/security \
    artipie/artipie:latest
