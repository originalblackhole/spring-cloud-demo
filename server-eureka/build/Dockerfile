# 下载maven与java的镜像
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8
EXPOSE 8761
ADD ../target/server-eureka-0.0.1-SNAPSHOT.jar server-eureka.jar
#启动java程序
CMD ["java","-jar","server-eureka.jar"]