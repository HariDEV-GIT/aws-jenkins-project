resource "aws_db_instance" "example_rds" {
  identifier         = "example-rds"
  engine             = "mysql"  # Change to your desired database engine
  engine_version     = "8.0"     # Change as needed
  instance_class     = "db.t2.micro"  # Change to your desired instance class
  allocated_storage   = 20
  username           = var.db_username  # Use the variable defined in variables.tf
  password           = var.db_password  # Use the variable defined in variables.tf
  db_name            = var.db_name  # Use the variable defined in variables.tf
  skip_final_snapshot = true

  tags = var.common_tags  # Use the centralized tags
}
