FROM openjdk:17-jdk-alpine
COPY . /app
WORKDIR /app
RUN ./gradle build
CMD ["java", "-cp", "build/classes/java/main", "com.example.quiz.QuizApp"]
