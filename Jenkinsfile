pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java17'
    }

    environment {
        SONAR_HOST = 'http://192.168.142.130:9000'
        APP_URL = 'http://192.168.142.130:8081/ecommerce'
    }

    stages {

        stage('Checkout') {
            steps {
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
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                    sh "mvn sonar:sonar -Dsonar.projectKey=ecommerce -Dsonar.host.url=$SONAR_HOST -Dsonar.login=$SONAR_TOKEN"
                }
            }
        }

        stage('Sonar Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
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
                sh '''
                sudo cp target/*.war /var/lib/tomcat9/webapps/ecommerce.war
                sudo systemctl restart tomcat9
                sleep 10
                '''
            }
        }

        stage('Check Application') {
            steps {
                sh "curl -f $APP_URL"
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                sh "zap-baseline.py -t $APP_URL || true"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: false
        }
    }
}
