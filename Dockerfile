FROM eclipse-temurin:17.0.9_9-jre-ubi9-minimal
ARG JAR_FILE=./build/libs/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar" ]