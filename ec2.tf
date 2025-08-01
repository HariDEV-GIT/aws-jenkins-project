resource "aws_instance" "ec2_instance" {
  ami           = "ami-020cba7c55df1f615" 
  instance_type = "t2.micro"
  key_name      = "jenkins_key"
  subnet_id     = "subnet-079540737949d4ae9"
  tags = {
  Name = "aws-demo"
  } 
}
