pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint') {
            steps {
                // Use the virtual environment's flake8 binary
                sh '.venv/bin/flake8 --exclude=.venv .'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'PYTHONPATH=$(pwd) .venv/bin/pytest'
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
            sh 'make clean'
        }
    }
}
