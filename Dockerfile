# Build stage
FROM maven:3.6.2-amazoncorretto-11 AS build
COPY . .
RUN mvn clean package

# Package stage
FROM amazoncorretto:11-alpine-jdk
COPY --from=build /target/backend-0.0.1-SNAPSHOT.jar martin.jar

ENTRYPOINT ["java","-jar","martin.jar"]