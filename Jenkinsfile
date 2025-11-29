pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java17'
    }

    stages {

        stage('Checkout') {
            steps {
                // Clone your Git repository
                git 'https://github.com/Med-Tl/easy.git'
            }
        }

        stage('Build & Test') {
            steps {
                // Build project and run unit tests
                sh 'mvn clean test'
            }
        }

        stage('Package') {
            steps {
                // Package into WAR
                sh 'mvn package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Deploy WAR to Tomcat running on port 8081
                sh '''
                sudo cp target/*.war /var/lib/tomcat9/webapps/ecommerce.war
                sudo systemctl restart tomcat9
                sleep 10
                '''
            }
        }

        stage('Check Application') {
            steps {
                // Verify app is running
                sh 'curl -f http://192.168.142.130:8081/ecommerce'
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                // Run ZAP baseline scan
                sh 'zap-baseline.py -t http://192.168.142.130:8081/ecommerce || true'
            }
        }
    }

    post {
        always {
            // Archive the WAR artifact
            archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: false
        }
    }
}
