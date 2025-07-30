resource "aws_glue_catalog_database" "glue_db" {
  name         = "glue_db_demo"
  description  = "Glue DataDBbase for data cataloging"
  tags         = var.common_tags  
}
