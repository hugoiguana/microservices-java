ARG ENV_IMG="openjdk:22-ea-21-slim-bullseye"
FROM $ENV_IMG

ARG JAR_DIR="target"
ENV JAR_DIR=${JAR_DIR}

ARG JAR_NAME="ms-product-0.0.1-SNAPSHOT.jar"
ENV JAR_NAME=${JAR_NAME}

WORKDIR /app
COPY ${JAR_DIR}/${JAR_NAME} .

EXPOSE 8080

#ENTRYPOINT ["java","-jar", "ms-product-0.0.1-SNAPSHOT.jar"]
#ENTRYPOINT ["java","-jar", "${JAR_NAME}"]
ENTRYPOINT java -jar $JAR_NAME