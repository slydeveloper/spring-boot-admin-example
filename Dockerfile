# build stage
FROM maven:3.6.3-jdk-8-slim AS build-stage
LABEL maintainer="sylwek.sokolowski@gmail.com"

COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean package

# run stage
FROM java:8-jre-alpine
LABEL maintainer="sylwek.sokolowski@gmail.com"

RUN apk add --no-cache curl
COPY --from=build-stage /tmp/target/*.jar /opt/spring-boot-admin-docker/app.jar
WORKDIR /opt/spring-boot-admin-docker
EXPOSE 1111

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","app.jar"]

