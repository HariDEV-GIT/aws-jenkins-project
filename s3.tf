resource "aws_s3_bucket" "example_bucket" {
  bucket = "dev-example-bucket"  # Change to a unique bucket name
  acl    = "private"

  tags = var.common_tags  # Use the centralized tags
}
