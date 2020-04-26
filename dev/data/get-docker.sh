#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "You should specify a Docker version"
	exit 1
fi

DOCKER_VERSION=$1

DOCKER_URL="https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz"

curl -sfL ${DOCKER_URL} | tar -xzC /usr/local/src
cp /usr/local/src/docker/docker* /usr/bin/

mkdir -p /etc/docker/plugins
