pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'poc'
        PROJECT_KEY = 'poc'
        SONAR_SCANNER_HOME = tool name: 'poc', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yugannkt/WebHosting-Terraform-CICD-SonarQube.git'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv(SONARQUBE_SERVER) {
                        sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${PROJECT_KEY} -Dsonar.sources=."
                    }
                }
            }
        }
        stage('Quality Gate') {
            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status == 'ERROR') {
                        currentBuild.result = 'FAILURE'
                        error "Quality Gate failed. Build aborted."
                    } else {
                        currentBuild.result = 'SUCCESS'  
                    }
                }
            }
        }
        stage('Deploy to Apache') {
            when {
                expression {
                    return currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    sh 'chmod +x scripts/deploy.sh'
                    sh './scripts/deploy.sh'
                }
            }
        }
    }
}
