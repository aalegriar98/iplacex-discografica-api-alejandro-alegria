FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . .
RUN gradle clean bootJar --no-daemon

FROM openjdk:21-jdk-slim
WORKDIR /app

COPY --from=build /app/build/libs/discografia-1.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
