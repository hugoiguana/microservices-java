#FROM openjdk:17-alpine
#FROM openjdk:17.0.2-jdk-slim-buster
FROM openjdk:22-ea-21-slim-bullseye


ARG JAR_NAME=ms-product-0.0.1-SNAPSHOT
ENV JAR_NAME_ENV=${JAR_NAME}

WORKDIR /app
COPY target/*.jar .

EXPOSE 8080
ENTRYPOINT ["java","-jar", "ms-product-0.0.1-SNAPSHOT.jar"]