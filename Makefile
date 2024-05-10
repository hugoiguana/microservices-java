ms-product-build:
	@echo "Building ms-product"
	./mvnw clean package -f ms-product/pom.xml

ms-product-build-no-test:
	@echo "Building ms-product"
	./mvnw clean package -Dmaven.test.skip=true -f ms-product/pom.xml

docker-compose-up:
	docker compose up -d

docker-compose-stop:
	docker compose stop

docker-clean:
	docker compose down
	docker volume rm db-ms-products
