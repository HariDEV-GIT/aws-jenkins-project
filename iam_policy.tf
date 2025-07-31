// S3 policy
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

// S3 deny policy
resource "aws_iam_policy" "deny_s3_access" {
  name        = "DenyS3Access"
  description = "Deny all actions on the S3 bucket for Terraform state"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Deny"
        Action = "s3:*"
        Resource = "arn:aws:s3:::terraform-statefile-bucket-demo-project/*"
      }
    ]
  })
  tags = var.common_tags
}
