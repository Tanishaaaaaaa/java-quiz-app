pipeline {
    agent any

    environment {
        registry = 'https://registry.hub.docker.com'
        dockerImage = 'tanishaaa31/java-quiz-app:latest'
        GRADLE_HOME = tool name: 'gradle', type: 'org.gradle.tooling.GradleInstallation'
        PATH = "$GRADLE_HOME/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Tanishaaaaaaa/java-quiz-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    def gradleCommand = "${tool name: 'gradle', type: 'org.gradle.tooling.GradleInstallation'}/bin/gradle"
                    sh "${gradleCommand} build"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    def gradleCommand = "${tool name: 'Gradle', type: 'org.gradle.tooling.GradleInstallation'}/bin/gradle"
                    sh "${gradleCommand} test"
                }
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
