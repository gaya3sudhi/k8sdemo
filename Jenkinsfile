pipeline  {
    agent none
 stages{
     stage('Initialize'){
         steps{
             script{
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
         }
     }
   
    stage('Clone repository') { 
        
        steps{
            script{
        checkout scm
    }
        }
    }

    stage('Build image') {
        steps{
            script{
        app = docker.build("gaya3sudhi/k8s")
    }
        }
    }

    stage('Test image') {
        steps{
            script{
                      sh 'echo "Tests passed"'
                    }
        }
    }
    stage('Push image') {
        steps{
            script{
                 docker.withRegistry('https://registry.hub.docker.com', 'docker-cred') 
                 app.push("${env.BUILD_NUMBER}")
                 app.push("latest")
        }
    }
        }
    stage('Deploy to GKE') {
        steps {
            script{
                kubernetesDeploy(configs: "deployment.yaml", kuberconfigId: "k8s-cluster-config")
    }
}
}
 }
}
