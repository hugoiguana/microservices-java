#!/bin/sh


ms-install () {
  docker compose up -d
}


ms-build () {
  V_MS_NAME=$1
  ./mvnw clean package -Dmaven.test.skip=true -f ${V_MS_NAME}/pom.xml
}


ms-build-docker-img () {
  V_MS_NAME=$1
  V_MS_VERSION=$2
  V_MS_DOCKER_IMG="openjdk:21-slim"
  V_JAR_DIR="${V_MS_NAME}/target"

  echo "Building $V_MS_NAME with version $V_MS_VERSION using Docker image $V_MS_DOCKER_IMG"

  docker build -t microservices-java-microservices-${V_MS_NAME}:${V_MS_VERSION}  --build-arg="ENV_IMG=${V_MS_DOCKER_IMG}" --build-arg="JAR_DIR=${V_JAR_DIR}" --build-arg="JAR_NAME=${V_MS_NAME}-${V_MS_VERSION}.jar" -f docker/Dockerfile.ms.java .
}
}