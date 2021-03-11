#操作/项目路径(Dockerfile存放的路劲)
BASE_PATH=/usr/local/jenkins
# 源jar路径  即jenkins构建后存放的路径（）
SOURCE_PATH=/home/jenkins/workspace
#docker 镜像/容器名字或者jar名字 这里都命名为这个
SERVER_NAME=server-eureka
#容器id
CID=$(docker ps | grep "$SERVER_NAME" | awk '{print $1}')
#镜像id
IID=$(docker images | grep "$SERVER_NAME" | awk '{print $3}')

echo "最新构建代码 $SOURCE_PATH/$SERVER_NAME/target/server-eureka.jar 迁移至 $BASE_PATH ...."
#把项目从jenkins构建后的目录移动到我们的项目目录下同时重命名下
 mv $SOURCE_PATH/$SERVER_NAME/$SERVER_NAME/target/server-eureka-0.0.1-SNAPSHOT.jar $BASE_PATH/server-eureka.jar

 mv /home/jenkins/workspace/server-eureka/server-eureka/docker.sh /usr/local/jenkins/docker.sh

 mv /home/jenkins/workspace/server-eureka/server-eureka/Dockerfile /usr/local/jenkins/Dockerfile

#修改文件的权限
echo "修改$BASE_PATH/$SERVER_NAME文件的权限"
 chmod 777 $(BASE_PATH)/$(SERVER_NAME).jar
 #chmod 777 /usr/ms_backend/ms_backend.jar
 echo "迁移完成"


# 构建docker镜像
        if [ -n "$IID" ]; then
                echo "存在$SERVER_NAME镜像，IID=$IID"
        else
                echo "不存在$SERVER_NAME镜像，开始构建镜像"
                        cd $BASE_PATH
                docker build -t $SERVER_NAME .
        fi

# 运行docker容器
 docker rm $SERVER_NAME     //删除原来的容器
# --name docker-test                 容器的名字为docker-test
#   -d                                 容器后台运行
#   -p 3636:3636                       指定容器映射的端口和主机对应的端口都为3636
#   -v /usr/ms_backend/:/usr/ms_backend/   将主机的/usr/ms_backend/目录挂载到容器的/usr/ms_backend/ 目录中（不可少每次本地更新jar包重启容器即可，不用重新构建镜像
docker run --name $SERVER_NAME -v $BASE_PATH:$BASE_PATH -d -p 8761:8761 $SERVER_NAME
echo "$SERVER_NAME容器创建完成"