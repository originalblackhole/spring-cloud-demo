# 下载maven与java的镜像
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8

WORKDIR /var/jenkins/server-eureka/

ARG PRO_ENV=prod

#RUN yum update -y

#RUN yum install vim -y

EXPOSE 8761

EXPOSE 8760

ADD ./target/server-eureka-0.0.1-SNAPSHOT.jar app.jar

#启动java程序
CMD ["java","-jar","app.jar","spring.profiles.active=dev"]