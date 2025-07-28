pipeline {
    agent any
    options {
        disableConcurrentBuilds()
    }
    environment {
        // Define environment variables for sensitive data
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') // Jenkins credential ID for AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Jenkins credential ID for AWS Secret Key
    }

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
                    sh 'terraform plan -var-file="dev.tfvars"'
                }
            }
        }

        stage('Terraform Plan - Prod') {
            steps {
                script {
                    // Plan the deployment for the production environment
                    sh 'terraform plan -var-file="prod.tfvars"'
                }
            }
        }

        stage('Terraform Apply - Dev') {
            when {branch 'main'}
            steps {
                script {
                    // Apply the configuration for the development environment
                    sh 'terraform apply -var-file="dev.tfvars" -auto-approve'
                }
            }
        }

        stage('Terraform Apply - Prod') {
            when {branch 'prod'}
            steps {
                script {
                    // Apply the configuration for the production environment
                    sh 'terraform apply -var-file="prod.tfvars" -auto-approve'
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
