#!/usr/bin/env bash

SERVER_NAME=server-config

# 停止容器
CID=$(docker ps -a | grep $SERVER_NAME | awk '{print $1}')
if [ -n "$CID" ] ;then
    docker stop $CID
    docker rm $CID
fi


# 删除旧镜像
IID=$(docker images | grep $SERVER_NAME | awk '{print $3}')
if [ -n "$IID" ] ;then
    docker rmi $IID
fi
