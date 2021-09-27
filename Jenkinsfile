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
         steps {
             bat 'docker build -t jenkinsapp.jar .'
                     }
           }

         //stage('Run Docker Image'){steps {bat 'docker run -p 9090:8084 jenkinsapp.jar'}}

         stage('Push Docker Image'){
         withCredentials([string(credentialsId: 'devhubjava', variable: 'devhubjava')]) {
                 bat "docker login -u devhubjava -p ${dockerHubPwd}"
                 
         }
              bat 'docker push  devhubjava/jenkinsapp.jar'
            }
      }
      post {
        always {
            cleanWs()
        }
    }
}
