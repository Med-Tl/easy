pipeline {
    agent any

    environment {
        SONAR_HOST_URL = 'http://localhost:9000'
    }

    tools {
        maven 'Maven' // This must match the name you set in Jenkins Global Tool Configuration
        jdk 'Java21'  // Optional: if you have a JDK configured in Jenkins
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
                withCredentials([string(credentialsId: 'sonar', variable: 'SONAR_TOKEN')]) {
                    sh "mvn sonar:sonar -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN}"
                }
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
            echo 'Pipeline failed!'
        }
    }
}
