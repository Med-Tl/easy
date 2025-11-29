pipeline {
    agent any

    environment {
        // SonarQube token from Jenkins credentials
        SONAR_TOKEN = credentials('test')   // Use credential ID 'test'
        SONAR_HOST_URL = 'http://localhost:9000'
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/Med-Tl/easy.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                sh "mvn sonar:sonar -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN}"
            }
        }

        stage('Deploy') {
            steps {
                sh 'sudo cp target/*.war /opt/tomcat9/webapps/'
                sh '/opt/tomcat9/bin/shutdown.sh || true'
                sh '/opt/tomcat9/bin/startup.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs!'
        }
    }
}
