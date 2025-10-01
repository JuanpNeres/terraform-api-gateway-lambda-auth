resource "aws_lambda_function" "auth_lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  s3_bucket = var.lambda_s3_bucket
  s3_key    = var.lambda_s3_key

  environment {
    DB_HOST     = var.db_host
    DB_USER     = var.db_user
    DB_PASSWORD = var.db_password
    DB_NAME     = var.db_name
  }

  role = aws_iam_role.lambda_exec_role.arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_function_name}_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "${var.lambda_function_name}_policy_attachment"
  roles      = [aws_iam_role.lambda_exec_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}