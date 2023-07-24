FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_9cce65b9_6d3d_4f8f_9d8b_78ed3c3c4f02 backend_generated_app_9cce65b9_6d3d_4f8f_9d8b_78ed3c3c4f02
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_9cce65b9_6d3d_4f8f_9d8b_78ed3c3c4f02/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]