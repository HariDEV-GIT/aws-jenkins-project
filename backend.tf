terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket-demo-project"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}
