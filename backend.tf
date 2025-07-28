terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket"  # Change to your S3 bucket name
    key            = "terraform/state"                # Change to your desired key
    region         = "us-east-1"                      # Change to your desired region
  }
}
