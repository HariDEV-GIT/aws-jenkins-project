resource "aws_secretsmanager_secret" "example_secret" {
  name        = "example_secret"
  description = "Example secret for storing sensitive information"

  tags = var.common_tags  # Use the centralized tags
}
