#FROM amazoncorretto:18

#MAINTAINER MartinMasetto

#COPY target/backend-0.0.1-SNAPSHOT.jar backend-0.0.1-SNAPSHOT.jar

#ENTRYPOINT ["java","-jar","/backend-0.0.1-SNAPSHOT.jar"]

#
# Build stage
#
FROM maven:3.8.4-openjdk-17 AS build
COPY . .
RUN mvn clean package

#
# Package stage
#

FROM openjdk:17-jdk-slim
COPY --from=build /target/backend-0.0.1-SNAPSHOT.jar martin.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","martin.jar"]