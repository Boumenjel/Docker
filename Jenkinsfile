pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                git url: 'https://github.com/Boumenjel/Docker.git'
                bat "./mvnw clean install"
            }
        }
        stage('Test') {
            steps {
                bat "./mvnw test"
            }
            post {
                always {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
          }
         stage('Build Docker Image'){
             bat 'docker build -t jenkinsapp.jar .'
           }

         stage('Run Docker Image'){
             bat 'docker run -p 9090:8084 jenkinsapp.jar'
           }
      }
      post {
        always {
            cleanWs()
        }
    }
}