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

         stage('Tag Docker Image'){
             steps {
                 bat 'docker tag jenkinsapp.jar devhubjava/jenkinsapp.jar'
             }
         }

         stage('Push Docker Image'){
              steps {
            withCredentials([string(credentialsId: 'devhubjava', variable: 'devhubjava')]) {
                 bat "docker login -u devhubjava -p ${dockerHubPwd}"      
              }
              bat 'docker push  devhubjava/jenkinsapp.jar'
            }
         }
      }
      post {
        always {
            cleanWs()
        }
    }
}
