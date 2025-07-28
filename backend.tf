terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}
