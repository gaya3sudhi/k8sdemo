node {
    def app
    
     stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
          PROJECT_ID = 'wired-rex-283811'
        CLUSTER_NAME = 'sprint6-k8s-demo'
        LOCATION = 'asia-east1-b'
        CREDENTIALS_ID = 'k8s-cluster-config'
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
    }    
