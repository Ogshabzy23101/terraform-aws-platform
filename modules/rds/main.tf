resource "aws_db_instance" "devops_lab_db" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  tags = {
    name = var.tag_name
  }
  region = var.region
  db_subnet_group_name = var.db_subnet_group
}
