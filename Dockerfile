FROM maven:3.6.3-ibmjava-8-alpine AS MAVEN_BUILD_ENVIRONMENT

COPY pom.xml /tmp/
COPY src /tmp/src/
COPY libraries /tmp/libraries/

WORKDIR /tmp/libraries/
RUN mvn clean install --no-transfer-progress

WORKDIR /tmp/
RUN mvn clean install --no-transfer-progress

FROM openjdk:8-jre

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

VOLUME /tmp
COPY --from=MAVEN_BUILD_ENVIRONMENT /tmp/target/fdk-dataset-api.jar app.jar

RUN sh -c 'touch /app.jar'
CMD java -jar app.jar
