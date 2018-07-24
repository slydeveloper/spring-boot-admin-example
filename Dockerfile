FROM java:8-jre-alpine

MAINTAINER Sylwester Sokolowski <sylwek.sokolowski@gmail.com>

RUN apk add --no-cache curl

COPY target/spring-boot-admin-example-*.jar /opt/spring-boot-admin-example/app.jar

EXPOSE 8080

WORKDIR /opt/spring-boot-admin-example

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","app.jar"]

