pipeline{
    agent any
    
    stages{
        stage("git checkout"){
            steps{
                git(
                    credentialsId: 'dddae4e8-1d3a-418c-a662-2acfcf0cb2ed',
                    url: 'https://github.com/yureiiko/test_jenkins.git',
                    branch: 'main'
                )
            }
        }
        
        stage("app compilation"){
            steps{
                sh 'mvn clean install'
            }
        }
        
        stage("unit test"){
            steps{
                sh 'mvn test'
            }
        }
        
        stage("docker image build"){
            steps{
                sh 'sudo docker build -t ellima/test_jenkins .'
            }
        }
        
        stage("docker image push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhubPass', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'sudo docker login -u ellima -p $PASSWORD'
                }
                sh 'sudo docker push ellima/test_jenkins'
            }
        }
    }
}
