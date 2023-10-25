pipeline {
    agent any

    tools {
        nodejs 'node-18'
    }
  
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm i -g @angular/cli'
                sh 'ng build'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'dist/*/', allowEmptyArchive: true
            }
        }
    }
}
