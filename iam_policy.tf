resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "Example policy for accessing resources"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*", "rds:*", "secretsmanager:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = var.common_tags  # Use the centralized tags
}
