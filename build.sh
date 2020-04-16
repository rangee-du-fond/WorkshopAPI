#!/bin/bash

if [ "$1" = "" ]; then
  printf 'the name of the docker image is missing ($1)'
  exit 1
fi
if [ "$2" = "" ]; then
  printf 'path to Dockerfile is missing ($2)'
  exit 1
fi

# building server
printf 'Building the server'
npm install && npm audit fix
npm run build

docker build -t $1 $2
