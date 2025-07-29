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
                    sh 'terraform plan -var-file="tfvars/dev.tfvars"'
                }
            }
        }

        stage('Terraform Plan - prod') {
            steps {
                script {
                    sh 'terraform plan -var-file="tfvars/prod.tfvars"'
                }
            }
        }
        
        stage('Terraform Apply - develop') {
            when {branch 'main'}
            steps {
                script {
                    sh 'terraform apply -var-file="tfvars/dev.tfvars" -auto-approve'
                }
            }
        }

        stage('Terraform Apply - Prod') {
            when {branch 'prod'}
            steps {
                script {
                    sh 'terraform apply -var-file="tfvars/prod.tfvars" -auto-approve'
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
