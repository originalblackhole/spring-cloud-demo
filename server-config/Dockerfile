# 下载maven与java的镜像
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8
#WORKDIR /home/jenkins/server-config
EXPOSE 8888
ADD ./target/server-config-0.0.1-SNAPSHOT.jar app.jar
#启动java程序
CMD ["java","-jar","app.jar"]