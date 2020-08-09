node {
    def app
    
     stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
          PROJECT_ID = 'wired-rex-283811'
        CLUSTER_NAME = 'sprint6-k8s-demo'
        LOCATION = 'asia-east1-b'
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
    kubernetesDeoloy{
          configs: 'deployment.yaml',
          kubeconfigId: 'k8s-cluster-config',    
            steps{
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId:  verifyDeployments: true])
            }
        }
    }    
}
