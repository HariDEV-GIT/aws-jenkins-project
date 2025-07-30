resource "aws_iam_policy" "policy" {
  name        = "s3_policy"
  description = "S3 policy for accessing resources"
  
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

  tags = var.common_tags
}
