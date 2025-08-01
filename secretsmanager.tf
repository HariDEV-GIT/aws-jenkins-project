resource "aws_secretsmanager_secret" "sm" {
  name         = "techops-sm"
  description  = "Secret for storing aws-jenkins information"
  tags         = var.common_tags 
}
