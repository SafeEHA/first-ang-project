pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
        sh 'npm cache clean --force'
        }
                sh 'npm install'
                sh 'ng build --prod'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'dist/**/*', allowEmptyArchive: true
            }
        }
    }
}
