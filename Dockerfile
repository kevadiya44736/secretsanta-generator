# Use a lightweight image for runtime
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage into the runtime image
COPY /target/*.jar app.jar

# Specify the command to run your application 1
CMD ["java", "-jar", "app.jar"]
