# openjdk8 image
FROM openjdk:8-bullseye
# copy the jar file to the container
COPY target/*.jar app.jar

# 外挂卷
# 临时目录
VOLUME /tmp
# 数据目录
VOLUME [ "/data" ]
# springboot 需要外挂 /app/config/application-prod.yml
VOLUME [ "/app/config" ]

# 暴露端口
# 主要端口
EXPOSE 8080
# 附属管理端口
EXPOSE 8081

# 启动命令，profile=prod
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=prod"]
