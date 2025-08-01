resource "aws_secretsmanager_secret" "sm" {
  name         = "demo_secret_techops"
  description  = "Secret for storing aws-jenkins information"
  tags         = var.common_tags 
}
