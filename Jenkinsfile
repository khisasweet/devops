pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/khisasweet/devops.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint') {
            steps {
                sh 'flake8 --exclude=.venv'
            }
         }

        stage('Run Tests') {
            steps {
                sh './.venv/bin/pytest'
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
