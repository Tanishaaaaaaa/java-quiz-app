pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Tanishaaaaaaa/java-quiz-app.git'
            }
        }

        stage('Build') {
            steps {
                bat 'gradle build'
            }
        }

        stage('Test') {
            steps {
                bat 'gradle test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("tanishaaa31/java-quiz-app:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'f0c6f2a4-287f-4ad9-b892-5851e97513d6') {
                        docker.image('tanishaaa31/java-quiz-app:latest').push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
