BASE_PATH=/usr/local/jenkins
# 源jar路径  即jenkins构建后存放的路径
SOURCE_PATH=/home/jenkins/workspace
#docker 镜像/容器名字或者jar名字 这里都命名为这个
SERVER_NAME=server-eureka
#容器id
CID=$(docker ps | grep "$SERVER_NAME" | awk '{print $1}')
#镜像id
IID=$(docker images | grep "$SERVER_NAME" | awk '{print $3}')
echo "最新构建代码 $SOURCE_PATH/$SERVER_NAME/target/server-eureka.jar 迁移至 $BASE_PATH ...."
#把项目从jenkins构建后的目录移动到我们的项目目录下同时重命名下
mv /home/jenkins/workspace/server-eureka/server-eureka/target/server-eureka-0.0.1-SNAPSHOT.jar /usr/local/jenkins/server-eureka.jar
#cp -bf /home/jenkins/workspace/server-eureka/server-eureka/docker.sh /usr/local/jenkins/docker.sh
#cp -bf /home/jenkins/workspace/server-eureka/server-eureka/Dockerfile /usr/local/jenkins/Dockerfile
#修改文件的权限
chmod 777 /usr/local/jenkins/server-eureka.jar
echo "迁移完成"
# 构建docker镜像
if [ -n "$IID" ] ;then
	echo "存在$SERVER_NAME镜像，IID=$IID"
else
	echo "不存在$SERVER_NAME镜像，开始构建镜像"
	cd $BASE_PATH
	docker build -t $SERVER_NAME .
fi

if [ -n "$CID" ] ;then
	echo "存在$SERVER_NAME容器，CID=$CID"
	docker stop $SERVER_NAME
	docker rm $SERVER_NAME
else
	echo "不存在$SERVER_NAME容器"
fi
# 运行docker容器
#docker run --name $SERVER_NAME -v $BASE_PATH:$BASE_PATH -d -p 8761:8761 $SERVER_NAME
docker run -itd -p 8761:8761 --name $SERVER_NAME --privileged=true -v $BASE_PATH:$BASE_PATH $SERVER_NAME
echo "$SERVER_NAME容器创建完成"