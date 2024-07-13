# Use an OpenJDK 17 JDK image as base
FROM openjdk:17-jdk-alpine

# Copy the application code and necessary files
COPY . /app

# Set the working directory
WORKDIR /app

# Build the application (if necessary)
RUN ./gradlew build

# Copy the entrypoint script into the Docker image and set it as executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Specify the entrypoint script to run the application
ENTRYPOINT ["/app/entrypoint.sh"]
