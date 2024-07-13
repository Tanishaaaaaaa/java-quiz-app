pipeline {
    agent any

    environment {
        registry = 'https://registry.hub.docker.com'
        dockerImage = 'tanishaaa31/java-quiz-app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Tanishaaaaaaa/java-quiz-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                bat 'gradlew build'
            }
        }

        stage('Test') {
            steps {
                bat 'gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build dockerImage
                }
            }
        }

         stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker-cred') {
                        docker.image(dockerImage).push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Example: Deploying with Kubernetes
                     sh "kubectl apply -f your-deployment.yaml"
                }
            }
        }
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
