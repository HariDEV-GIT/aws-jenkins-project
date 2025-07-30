pipeline {
    agent any
    options {
        disableConcurrentBuilds()
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }              

    stages {
        stage('Terraform Init - develop') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Init - prod') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan - develop') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'db_username', variable: 'DB_USERNAME'), string(credentialsId: 'db_password', variable: 'DB_PASSWORD')]) {
                        sh '''
                        terraform plan -var="db_username=${DB_USERNAME}" -var="db_password=${DB_PASSWORD}" -var-file="tfvars/dev.tfvars"
                        '''
                    }
                }
            }
        }

        stage('Terraform Plan - prod') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'db_username', variable: 'DB_USERNAME'), string(credentialsId: 'db_password', variable: 'DB_PASSWORD')]) {
                        sh '''
                        terraform plan -var="db_username=${DB_USERNAME}" -var="db_password=${DB_PASSWORD}" -var-file="tfvars/prod.tfvars"
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply - develop') {
            when {branch 'main'}
            steps {
                script {
                    withCredentials([string(credentialsId: 'db_username', variable: 'DB_USERNAME'), string(credentialsId: 'db_password', variable: 'DB_PASSWORD')]) {
                        sh '''
                        terraform apply -var="db_username=${DB_USERNAME}" -var="db_password=${DB_PASSWORD}" -var-file="tfvars/dev.tfvars" -auto-approve
                        '''
                    }
                }
            }
        }   
        
        stage('Terraform Apply - prod') {
            when {branch 'prod'}
            steps {
                script {
                    withCredentials([string(credentialsId: 'db_username', variable: 'DB_USERNAME'), string(credentialsId: 'db_password', variable: 'DB_PASSWORD')]) {
                        sh '''
                        terraform apply -var="db_username=${DB_USERNAME}" -var="db_password=${DB_PASSWORD}" -var-file="tfvars/prod.tfvars" -auto-approve
                        '''
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
}
