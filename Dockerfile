#Build stage

FROM gradle:latest AS BUILD
WORKDIR /usr/app/
COPY . . 
RUN gradle build

# package stage
FROM  eclipse-temurin:17.0.9_9-jre-ubi9-minimal
#windows: eclipse-temurin:17.0.9_9-jre-windowsservercore-1809
ENV JAR_NAME=app.jar
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT ["java","-jar", "$APP_HOME/build/libs/$JAR_NAME" ]