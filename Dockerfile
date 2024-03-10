FROM openjdk:11
CMD ["./gradlew", "clean", "bootJar"]
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/future-0.0.1-SNAPSHOT.jar"]