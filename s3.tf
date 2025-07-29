resource "aws_s3_bucket" "aws-jenkins-demo-bucket-hari" {
  bucket = "aws-jenkins-demo-bucket" 

  tags = var.common_tags 
}
