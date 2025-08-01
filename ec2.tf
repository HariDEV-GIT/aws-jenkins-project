resource "aws_instance" "ec2_instance" {
  ami           = "ami-020cba7c55df1f615" 
  instance_type = "t2.micro"
  key_name      = "jenkins_key"
  tags = {
  Name = "aws-demo"
  }
  tags         = var.common_tags  
}
