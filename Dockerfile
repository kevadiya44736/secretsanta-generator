# Use an official Maven image as a parent image
FROM openjdk:11-jdk-slim AS build

WORKDIR /app

# Copy the Maven project descriptor file into the container
COPY pom.xml .

# Download and resolve Maven dependencies
RUN apt-get update && \
    apt-get install -y maven && \
    mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

#Copy all other file into container /app
COPY . .

# Build the application
RUN ./mvnw package

# Use a lightweight image for runtime
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage into the runtime image
COPY --from=build /app/target/*.jar app.jar

# Specify the command to run your application
CMD ["java", "-jar", "app.jar"]
