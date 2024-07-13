pipeline {
    agent any
    
    environment {
        registry = 'https://index.docker.io/v1/'
        dockerImage = 'tanishaaa31/java-quiz-app:latest'
    }
    
    tools {
        // Specify the JDK installation configured in Jenkins
        jdk 'jdk11'
        // Specify the Gradle installation configured in Jenkins
        gradle 'gradle'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Git repository
                git url: 'https://github.com/Tanishaaaaaaa/java-quiz-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Build the project using Gradle
                bat 'gradle build'
            }
        }

        stage('Test') {
            steps {
                // Run tests using Gradle
                bat 'gradle test'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build dockerImage
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'f0c6f2a4-287f-4ad9-b892-5851e97513d6') {
                        docker.image("tanishaaa31/java-quiz-app:latest").push()
                    }
                }
            }
        }

        // Optional: Add a deployment stage if needed
        // stage('Deploy') {
        //     steps {
        //         bat 'kubectl apply -f your-deployment.yaml'
        //     }
        // }
    }

    post {
        success {
            echo 'Pipeline successfully executed!'
            // Add further success actions if needed
        }
        failure {
            echo 'Pipeline failed!'
            // Add further failure actions if needed
        }
    }
}
