variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

/* variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database"
  type        = string
} */

variable "dev_account_id" {
  description = "The AWS account ID for the development environment"
  type        = string
}

variable "prod_account_id" {
  description = "The AWS account ID for the production environment"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Environment = "Dev"  # Default to Dev, can be overridden in prod.tfvars
    Project     = "YourProjectName"  # Change as needed
  }
}
