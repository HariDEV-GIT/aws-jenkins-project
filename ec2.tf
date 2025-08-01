resource "aws_instance" "ec2_instance" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  subnet_id     = "subnet-079540737949d4ae9"
  key_name      = "jenkins_key"
  tags = {
    Name = "jenkins_testing"
  }
}
