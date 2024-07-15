# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine as builder

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and other necessary files
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .

# Copy the source code
COPY src ./src

# Grant execution rights to the Gradle wrapper
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build

# Use a minimal runtime image
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=builder /app/build/libs/*.jar ./app.jar

# Define the command to run the application
CMD ["java", "-jar", "app.jar"]
