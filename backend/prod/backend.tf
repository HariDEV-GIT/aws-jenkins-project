terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket-demo-project-prod"
    key            = "terraform/state"
    region         = "ap-south-1"
  }
}
