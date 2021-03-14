#!/usr/bin/env bash

SERVER_NAME=server-eureka
BASE_PATH=/usr/local/jenkins/$SERVER_NAME
# 源jar路径  即jenkins构建后存放的路径
SOURCE_PATH=/home/jenkins/workspace/$SERVER_NAME/$SERVER_NAME
#docker 镜像/容器名字或者jar名字 这里都命名为这个

docker run --name $SERVER_NAME -d -p 8761:8761 --privileged=true -v :$SOURCE_PATH:$BASE_PATH $SERVER_NAME