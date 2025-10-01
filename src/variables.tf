variable "region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
  default     = "user-authentication-lambda"
}

variable "rds_instance_type" {
  description = "The instance type for the RDS database."
  type        = string
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "The username for the RDS database."
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database to create in RDS."
  type        = string
  default     = "user_auth_db"
}

variable "api_gateway_name" {
  description = "The name of the API Gateway."
  type        = string
  default     = "UserAuthenticationAPI"
}