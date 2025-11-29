pipeline {
    agent any

    environment {
        SONAR_HOST_URL = 'http://localhost:9000'
    }

    tools {
        maven 'Maven'        // Name from Jenkins Global Tool Configuration
        jdk 'Java21'         // JDK configured in Jenkins
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
                withSonarQubeEnv('sonarserver') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    sudo cp target/*.war /opt/tomcat9/webapps/
                    sudo /opt/tomcat9/bin/shutdown.sh || true
                    sudo /opt/tomcat9/bin/startup.sh
                '''
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
