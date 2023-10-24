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
        sh 'apt-get update' // Update the package list (Linux-based agents)
        sh 'apt-get install nodejs npm -y' // Install Node.js and npm (Linux-based agents)
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
