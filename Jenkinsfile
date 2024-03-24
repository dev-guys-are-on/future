pipeline {
    agent any
    tools{
        gradle 'gradle_7_6_4'
    }
    stages{
        stage('Build Gradle'){
            steps{
                checkout scmGit(branches: [[name: '*/develop']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dev-guys-are-on/future']])
                sh './gradlew clean build'
            }
        }
        stage('Build Docker Image'){
            steps{
                script {
                    sh 'docker build -t ash9659/future .'
                }

            }
        }
        stage('Push Image To Docker Hub'){
            steps{
                script{

                    withCredentials([string(credentialsId: 'docker_hub_pwd', variable: 'docker_hub_pwd'), string(credentialsId: 'docker_hub_user', variable: 'docker_hub_user')]) {
                    sh 'docker login -u ash9659 -p ${docker_hub_pwd}'
                    }
                    sh 'docker push ash9659/future'

                }
            }
        }
        stage('Deploy to K8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment.yaml', kubeconfigId: 'k8s_id')
                }
            }

        }
    }
}
