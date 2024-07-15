# Use an appropriate base image
FROM openjdk:17-jdk-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the source code
COPY . .

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
