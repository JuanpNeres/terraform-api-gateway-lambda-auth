resource "aws_lambda_function" "auth_lambda" {
  function_name = "auth_lambda"
  handler       = "index.handler"
  runtime       = "nodejs14.x"  # Adjust runtime as needed
  role          = aws_iam_role.lambda_exec.arn
  filename      = "path/to/your/lambda/package.zip"  # Update with the actual path to your Lambda package
  source_code_hash = filebase64sha256("path/to/your/lambda/package.zip")  # Update with the actual path to your Lambda package

  environment {
    DB_HOST     = var.db_host
    DB_USER     = var.db_user
    DB_PASSWORD = var.db_password
    DB_NAME     = var.db_name
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda_policy_attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}