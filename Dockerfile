<<<<<<< HEAD
FROM openjdk:11-jre-slim
ADD build/libs/*.jar final.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "final.jar"]
=======
FROM openjdk:11
CMD ["./gradlew", "clean", "bootJar"]
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/future-0.0.1-SNAPSHOT.jar"]
>>>>>>> 2c02262f3b12e67f2cb4839c51e6b95b4cee3519
