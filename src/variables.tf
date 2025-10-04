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

variable "api_gateway_name" {
  description = "The name of the API Gateway."
  type        = string
  default     = "UserAuthenticationAPI"
}