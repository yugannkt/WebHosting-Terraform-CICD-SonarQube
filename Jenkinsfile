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
                waitForQualityGate abortPipeline: false
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
                    sh 'sudo systemctl start apache2'
                    sh 'sudo rm -rf /var/www/html/*'
                    sh 'sudo cp -r * /var/www/html/'
                    sh 'sudo chown -R www-data:www-data /var/www/html/*'
                    sh 'sudo chmod -R 755 /var/www/html/*'
                    sh 'sudo systemctl restart apache2'
                }
            }
        }
    }
}
