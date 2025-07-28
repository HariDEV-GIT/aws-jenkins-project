resource "aws_s3_bucket" "aws-jenkins-demo-bucket" {
  bucket = "aws-jenkins-demo-bucket" 
  acl    = "private"

  tags = var.common_tags 
}
