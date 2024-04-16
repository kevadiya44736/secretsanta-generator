pipeline { 

    agent any 

  

    tools { 

        maven 'maven' 

        jdk 'jdk' 

        dockerTool 'docker' 

    } 

    

   

    stages {  

         

        stage('Compile') { 

            steps { 

               sh 'mvn compile' 

            } 

        } 

         

        stage('test') { 

            steps { 

               sh 'mvn test' 

            } 

        } 


        stage('build') { 

            steps { 

                sh './mvnw package' 

            } 

        } 

         

         stage('docker image') { 

            steps { 

                sh 'docker build -t hrk123123/secret_santa:${BUILD_NUMBER} .' 

            } 

        } 

         

          stage('docker image push') { 

              environment {  

                docker_hub_cred = credentials('docker_hub')  

            } 

               

            steps { 

                withDockerRegistry(credentialsId: 'docker_hub', url: 'https://index.docker.io/v1/') { 

                sh 'docker push hrk123123/secret_santa:${BUILD_NUMBER}' 

                 } 

                 

            } 

        } 

    } 

} 
