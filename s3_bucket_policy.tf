resource "aws_s3_bucket_policy" "deny_access_policy" {
  bucket = "terraform-statefile-bucket-demo-project"  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Deny"
        Principal = "*"
        Action = "s3:*"
        Resource = [
          "arn:aws:s3:::terraform-statefile-bucket-demo-project",
          "arn:aws:s3:::terraform-statefile-bucket-demo-project/*"
        ]
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = "420602990842"
          }
        }
      }
    ]
  })
}
