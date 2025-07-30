resource "aws_glue_catalog_database" "glue_db" {
  name         = "glue_db_demo"
  description  = "This is my Glue Database for data cataloging"
  tags         = var.common_tags  
}
