pipeline {
    agent any

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

        stage('Deploy') {
            steps {
                sh 'sudo cp target/*.war /var/lib/tomcat9/webapps/'
                sh 'sudo systemctl restart tomcat9'
            }
        }
    }
}

