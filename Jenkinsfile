pipeline {

    agent {
        dockerfile true
       }

    enviroment {
        registry = "livingstone03/todo-app" 
        registryCredential = 'dockerhub-login' 
        dockerImage = ''
    }

    stages {

        stage ("initial cleanup") {
          steps {
                dir("${WORKSPACE}") {
               deleteDir()
              }
            }
        }
    }

        stage('Checkout SCM') {
          steps {
            git branch: 'feature', url: 'https://github.com/Livingstone95/Todo-app.git', credentialsId: 'github-login'
          }
       }

       stage('Build Docker Image') {
         steps {
           script {
              dockerImage = docker.build todo-app:0.0.1
                  }
           } 
       }

        stage('Tag the image')
          steps {
              sh 'docker image tag todo-app:0.0.1 livingstone03/todo-app:feature-0.0.1'
          }


        stage('Deploy docker image to docker hub') {
          steps {
            script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push('livingstone03/todo-app:feature-0.0.1')
               }
            }

           }
        }

        stage('Remove unsused images')
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }

}
