resource "aws_db_instance" "user_auth_db" {
  identifier         = "user-auth-db"
  engine            = var.db_engine
  instance_class    = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "UserAuthDB"
  }
}

resource "aws_db_subnet_group" "user_auth_db_subnet_group" {
  name       = "user-auth-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "UserAuthDBSubnetGroup"
  }
}

resource "aws_db_parameter_group" "user_auth_db_parameter_group" {
  name   = "user-auth-db-parameter-group"
  family = var.db_parameter_family

  parameter {
    name  = "max_connections"
    value = "100"
  }
}