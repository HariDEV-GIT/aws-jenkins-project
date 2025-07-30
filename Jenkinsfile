pipeline {
    agent any
    options {
        disableConcurrentBuilds()
    }

    stages {
        stage('Terraform Init - develop') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Init - prod') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id-prod', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key-prod', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan - develop') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh '''
                        terraform plan -var-file="tfvars/dev.tfvars"
                        '''
                    }
                }
            }
        }

        stage('Terraform Plan - prod') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id-prod', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key-prod', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh '''
                        terraform plan -var-file="tfvars/prod.tfvars"
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply - develop') {
            when { branch 'main' }
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh '''
                        terraform apply -var-file="tfvars/dev.tfvars" -auto-approve
                        '''
                    }
                }
            }
        }   
        
        stage('Terraform Apply - prod') {
            when { branch 'prod' }
            steps {
                script {
                    withCredentials([string(credentialsId: 'aws-access-key-id-prod', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret-access-key-prod', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh '''
                        terraform apply -var-file="tfvars/prod.tfvars" -auto-approve
                        '''
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
