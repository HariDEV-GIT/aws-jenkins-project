resource "aws_secretsmanager_secret" "s3_details_secret" {
  name        = "aws-jenkins-demo-bucket"
  description = "Example secret for storing aws-jenkins information"

  tags = var.common_tags 
}
