nodes  {
    agent {label "kubepod"}
 stages{
     stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
   
    stage('Clone repository') { 
        checkout scm
    }

    stage('Build image') {
        app = docker.build("gaya3sudhi/k8s")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
           docker.withRegistry('https://registry.hub.docker.com', 'docker-cred') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
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
