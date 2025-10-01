resource "aws_db_instance" "default" {
  identifier              = var.db_instance_identifier
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true
  publicly_accessible     = false
  vpc_security_group_ids  = [var.vpc_security_group_id]
  tags = {
    Name = var.db_instance_identifier
  }
}

output "db_instance_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.default.id
}