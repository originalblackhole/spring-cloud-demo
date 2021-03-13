#!/usr/bin/env bash

SERVER_NAME=server-config
#容器id
CID=$(docker ps | grep "$SERVER_NAME" | awk '{print $1}')
#镜像id
IID=$(docker images | grep "$SERVER_NAME" | awk '{print $3}')

if [ -n "$CID" ] ;then
	echo "存在$SERVER_NAME容器，CID=$CID"
	docker stop $SERVER_NAME
	docker rm $SERVER_NAME
	echo "删除$SERVER_NAME容器，CID=$CID"
fi

docker run -d --privileged=true -p 8761:8761  server/config
#删除没有启动的镜像
docker rmi IID