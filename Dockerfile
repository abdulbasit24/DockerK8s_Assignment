# OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# working directory in the container
WORKDIR /app

# Copy the jar file to the container
COPY target/DevOpss-0.0.1-SNAPSHOT.jar /app/devops.jar

# Expose to port 8081
EXPOSE 8081

# Run the jar file
ENTRYPOINT ["java", "-jar", "devops.jar"]
