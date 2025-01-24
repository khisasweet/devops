pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/khisasweet/devops.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'make test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'make docker-build'
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'make docker-run'
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution complete.'
        }
        cleanup {
            echo 'Cleaning up resources.'
            sh 'make clean'
        }
    }
}
