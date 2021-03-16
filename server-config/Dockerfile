# 下载maven与java的镜像
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8

WORKDIR /var/jenkins/server-config

ARG PRO_ENV=dev

#RUN yum update -y

#RUN yum install vim -y

EXPOSE 8888

EXPOSE 8899

ADD ./target/server-config-0.0.1-SNAPSHOT.jar app.jar

#启动java程序
CMD ["java","-jar","app.jar","spring.profiles.active=dev"]