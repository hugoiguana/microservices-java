#FROM openjdk:17-alpine
#FROM openjdk:17.0.2-jdk-slim-buster
ARG ENV_IMG=nginx:stable-alpine3.19
FROM ENV_IMG

ARG JAR_NAME=ms-product-0.0.1-SNAPSHOT
ENV JAR_NAME_ENV=${JAR_NAME}

WORKDIR /app
COPY target/*.jar .

EXPOSE 8080
ENTRYPOINT ["java","-jar", "ms-product-0.0.1-SNAPSHOT.jar"]