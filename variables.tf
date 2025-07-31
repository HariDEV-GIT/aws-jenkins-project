variable "region" {
  description   = "The AWS region to deploy resources"
  default       = "us-east-1"
}

variable "db_username" {
  description   = "The username for the rds database"
  type          = string
  sensitive     = true
}

variable "db_password" {
  description   = "The password for the rds database"
  type          = string
  sensitive     = true
}

variable "aws_account_id" {
  description   = "The AWS account ID for the development environment"
  default       = "420602990842"
}

variable "common_tags" {
  description   = "Common tags for all resources"
  type          = map(string)
  default       = {
    Environment = "Dev" 
    Project     = "aws-demo-project" 
  }
}
