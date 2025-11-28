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
                sh 'sudo cp target/*.war /opt/tomcat9/webapps/'
                sh 'sudo /opt/tomcat9/bin/shutdown.sh || true9'
                sh 'sudo /opt/tomcat9/bin/startup.sh'
            }
        }
    }
}

