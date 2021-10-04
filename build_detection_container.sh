#!env bash


if [ -z $1 ]; then 
    echo $0 image-name:tag
    exit 1
fi 

docker build -t $1 -f detection-container/Dockerfile detection-container

