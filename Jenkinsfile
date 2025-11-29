pipeline {
    agent any

    environment {
        SONAR_HOST_URL = 'http://localhost:9000'
    }

    tools {
        maven 'Maven'       // Name from Jenkins Global Tool Configuration
        jdk 'Java21'        // If you configured a JDK in Jenkins
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
                    sh """
                        mvn sonar:sonar \
                        -Dsonar.host.url=${SONAR_HOST_URL} \
                        -Dsonar.login=${SONAR_TOKEN}
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                // Allow Jenkins to restart Tomcat without password
                sh 'sudo cp target/*.war /opt/tomcat9/webapps/'
                sh 'sudo /opt/tomcat9/bin/shutdown.sh || true'
                sh 'sudo /opt/tomcat9/bin/startup.sh'
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
