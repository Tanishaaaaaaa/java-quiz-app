# Use an appropriate base image
FROM openjdk:17-jdk-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper script and necessary build files
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Ensure gradlew is executable (if needed)
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build

# Example: Copy built artifact to a runtime image
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the built artifact from the builder stage
COPY --from=builder /app/build/libs/java-quiz-app.jar .

# Command to run the application
CMD ["java", "-jar", "java-quiz-app.jar"]
