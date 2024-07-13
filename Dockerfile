# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy Gradle Wrapper files into the container
COPY gradlew .
COPY gradle ./gradle

# Copy all other files
COPY . .

# Make the Gradle Wrapper executable
RUN chmod +x gradlew

# Run Gradle build using the wrapper (gradlew)
RUN ./gradlew build

# Specify the command to run your application
CMD ["java", "-cp", "build/classes/java/main", "com.example.quiz.QuizApp"]
