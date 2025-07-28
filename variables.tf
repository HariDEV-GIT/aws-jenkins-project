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
