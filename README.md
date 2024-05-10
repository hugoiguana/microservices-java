# Microservices

![](doc/architecture_diagram.jpg?raw=true "Architecture diagram")
[]()

## Java dependencies:
* JAVA 21
* [Spring Boot](https://spring.io/projects/spring-boot)
* [Spring Data](https://spring.io/projects/spring-data)
* [Spring Cloud Gateway](https://spring.io/projects/spring-cloud-gateway)
* [Spring Cloud Security](https://spring.io/projects/spring-cloud-security)
* [Lombok](https://projectlombok.org/)
* [springdoc-openapi](https://springdoc.org/#Introduction)


## Java test dependencies:
* [JUnit](https://junit.org/junit5/docs/current/user-guide/#writing-tests)
* [Rest Assured](https://rest-assured.io/)
* [Spring Boot testcontainers](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
* [Spring cloud contracts](https://spring.io/projects/spring-cloud-contract)

## Security tools:
* [Keycloak](https://www.keycloak.org/documentation)
* [Vault](https://developer.hashicorp.com/vault/docs)

## Storage tools:
* [MinIO](https://min.io/docs/kes/tutorials/getting-started/)

## Frontend:
* [Microfrontend - Single SPA](https://single-spa.js.org/docs/microfrontends-concept/)
* [Backend for frontend](https://bff-patterns.com/)
* [React](https://pt-br.legacy.reactjs.org/docs/getting-started.html) - [Angular](https://angular.io/docs)

## Devops Tools:
* [Kubernetes](https://kubernetes.io/docs/home/)
* [Docker](https://docs.docker.com/)
* [Docker compose](https://docs.docker.com/compose/)
* [Kind](https://kind.sigs.k8s.io/) or [Minikube](https://minikube.sigs.k8s.io/docs/start/)
* [Nginx(Reverse Proxy)](https://nginx.org/en/docs/)
* [Healm charts](https://helm.sh/docs/chart_template_guide/getting_started/)
* [Terraform](https://developer.hashicorp.com/terraform?product_intent=terraform)
* [ArgoCD](https://argo-cd.readthedocs.io/en/stable/getting_started/)
* [Jenkins](https://www.jenkins.io/sigs/docs/)
* [Vagrant](https://developer.hashicorp.com/vagrant/docs)


## Mavem commands:
```maven
./mvnw clean package -Dmaven.test.skip=true -f ms-product/pom.xml
```

## Docker commands:
```maven
docker ps | grep microservices-
docker ps -a | grep microservices-
docker images | grep microservices-
docker stop microservices-nginx microservices-db-ms-product && docker rm microservices-nginx microservices-db-ms-product

docker stop microservices-ms-product && docker rm microservices-ms-product

docker build -t microservices-java-microservices-ms-product --build-arg="ENV_IMG=openjdk:22-ea-21-slim-bullseye" --build-arg="JAR_NAME=ms-product-0.0.1-SNAPSHOT" -f docker/Dockerfile.ms.java .

docker run -p 8080:8080 microservices-java-microservices-ms-product:0.0.1-SNAPSHOT

docker volume ls
docker volume rm microservices-db-ms-product
docker logs microservices-db-ms-product -f
docker network ls
docker network rm microservices-network
docker exec -it microservices-db-ms-product /bin/sh
docker exec microservices-db-ms-product echo $DB_URL
```

## Docker compose commands:
```docker
docker compose up -d
docker compose stop
```

## Postgres DB - Connect on a container:
```bash
docker exec -u root  -it microservices-db-ms-product psql --host localhost -U app -d ms-product -p 5432

# Show data bases:
\l

# Show Users:
\du;

# Connect to a database:
\connect dbname
\c dbname

# Show relations(tables)
\dt
\dt+
```

## Postgres DB - Get a dump from a container:
```bash
docker exec -it microservices-db-ms-product /bin/sh
pg_dump -U app -W -d ms-product > ms-product.sql
docker cp microservices-db-ms-product:/ms-product.sql ms-product/ms-product-dump.sql
```

## Shell commands:
```bash
chmod +X install.sh
bash -c "source install.sh; ms-install"
bash -c "source install.sh; ms-build-docker-img ms-product 0.0.1-SNAPSHOT"
```