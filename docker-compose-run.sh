#!/bin/bash

# build JAR package
mvn clean package -Dmaven.test.skip=true

# run Docker Compose and force to rebuild image
docker-compose up -d --build