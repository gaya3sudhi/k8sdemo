pipeline {
    agent any
        stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
   
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("gaya3sudhi/python-git")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-cred') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }        
        stage('Deploy to GKE') {
            steps{
                script{
                    kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "kube-config2") 
        }
    }   
}
    }
}
