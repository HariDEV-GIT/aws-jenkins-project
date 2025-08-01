resource "aws_iam_role" "s3" {
  name               = "s3_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "s3.amazonaws.com" 
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
  tags = var.common_tags
}

// S3 deny role
resource "aws_iam_role" "terraform_role" {
  name = "TerraformS3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
  tags = var.common_tags
}
