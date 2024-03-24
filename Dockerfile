FROM openjdk:11-jre-slim
ADD build/libs/*.jar final.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "final.jar"]
