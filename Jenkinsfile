pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java17'
    }

    environment {
        // If needed, you can also store ZAP_HOME or other env vars here
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
                sh 'mvn clean test'
            }
        }

        stage('SAST - SonarQube Analysis') {
            steps {
                // Use your configured SonarQube server
                withSonarQubeEnv('sonarqube') {
                    sh "mvn sonar:sonar -Dsonar.projectKey=ecommerce"
                }
            }
        }

        stage('Sonar Quality Gate') {
            steps {
                // Wait for the quality gate result; fail pipeline if gate fails
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Deploy WAR to Tomcat on port 8081
                sh '''
                sudo cp target/*.war /var/lib/tomcat9/webapps/ecommerce.war
                sudo systemctl restart tomcat9
                sleep 10
                '''
            }
        }

        stage('Check Application') {
            steps {
                sh 'curl -f http://192.168.142.130:8081/ecommerce'
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                sh 'zap-baseline.py -t http://192.168.142.130:8081/ecommerce || true'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: false
        }
    }
}
