// security group 
resource "aws_security_group" "my_db_sg" {
  name        = "rds_sg"
  description = "Allow access to RDS instance"
  vpc_id      = "vpc-eff25692"  
  tags        = var.common_tags  

  ingress {
    from_port   = 3306  # Change to your database port
    to_port     = 3306  # Change to your database port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to your desired CIDR block for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// subnet group 
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "rds_db_subnet_group"
  subnet_ids = ["subnet-079540737949d4ae9"]
  tags       = var.common_tags  # Apply common tags if you have them defined
}

// RDS instance
resource "aws_db_instance" "my_db" {
  identifier               = "aws-demo-db"
  engine                   = "mysql"  
  engine_version           = "8.0"    
  instance_class           = "db.t3.micro"  
  allocated_storage        = 20  
  db_subnet_group_name     = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids   = [aws_security_group.my_db_sg.id]
  username                 = var.db_username  
  password                 = var.db_password  
  skip_final_snapshot      = false 
  tags                     = var.common_tags  
}
