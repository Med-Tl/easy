pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'sonarqube'
    }

    tools {
        maven 'Maven'
        jdk 'Java17'
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/marwaiset/e-commerce.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('SAST - SonarQube') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                  nohup java -jar target/*.jar &
                '''
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                sh 'zap-baseline.py -t http://localhost:8081 || true'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
        }
    }
}
