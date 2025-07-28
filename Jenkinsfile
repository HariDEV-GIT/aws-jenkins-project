pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }                

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan - Dev') {
            steps {
                script {
                    // Plan the deployment for the development environment
                    sh 'terraform plan -var-file="tfvars/dev.tfvars"'
                }
            }
        }

        stage('Terraform Apply - Dev') {
            when {branch 'main'}
            steps {
                script {
                    // Apply the configuration for the development environment
                    sh 'terraform apply -var-file="tfvars/dev.tfvars" -auto-approve'
                }
            }
        }

        stage('Terraform Plan - Prod') {
            steps {
                script {
                    // Plan the deployment for the production environment
                    sh 'terraform plan -var-file="tfvars/prod.tfvars"'
                }
            }
        }

        stage('Terraform Apply - Prod') {
            when {branch 'prod'}
            steps {
                script {
                    // Apply the configuration for the production environment
                    sh 'terraform apply -var-file="tfvars/prod.tfvars" -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            // Notify on success (optional)
            echo 'Deployment completed successfully!'
        }
        failure {
            // Notify on failure (optional)
            echo 'Deployment failed!'
        }
    }
} 
