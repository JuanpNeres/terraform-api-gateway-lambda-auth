# Terraform API Gateway and Lambda Authentication

This project sets up an API Gateway integrated with AWS Lambda for user authentication.

## Project Structure

```
terraform-api-gateway-lambda-auth
├── src
│   ├── main.tf                # Main Terraform configuration file
│   ├── variables.tf           # Input variables for customization
│   ├── outputs.tf             # Output values after deployment
│   ├── api_gateway.tf         # API Gateway configuration
│   ├── lambda.tf              # Lambda function configuration
│   └── modules
│       ├── api_gateway
│       │   └── main.tf        # API Gateway module
│       └── lambda
│           └── main.tf        # Lambda module
└── README.md                  # Project documentation
```

## Setup Instructions

1. **Prerequisites**
   - Ensure you have Terraform installed on your machine.
   - Configure your AWS credentials to allow Terraform to provision resources.

2. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd terraform-api-gateway-lambda-auth
   ```

3. **Navigate to the Source Directory**
   ```bash
   cd src
   ```

4. **Customize Variables**
   - Edit `variables.tf` to set your desired configurations such as region and Lambda function name.

5. **Initialize Terraform**
   ```bash
   terraform init
   ```

6. **Plan the Deployment**
   ```bash
   terraform plan
   ```

7. **Apply the Configuration**
   ```bash
   terraform apply
   ```

8. **Access the API**
   - After deployment, the output will provide the API Gateway endpoint for user authentication.

## Usage

- The API Gateway exposes endpoints for user authentication.
- The Lambda function handles the authentication logic.

## Notes

- Ensure that your Lambda function has the necessary permissions for its operations.
- Monitor the AWS console for logs and metrics related to the API Gateway and Lambda function for troubleshooting.

## License

This project is licensed under the MIT License.