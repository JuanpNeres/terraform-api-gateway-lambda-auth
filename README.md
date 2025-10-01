# Terraform API Gateway and Lambda Authentication

This project sets up an API Gateway integrated with AWS Lambda for user authentication, utilizing an RDS database for storing user credentials.

## Project Structure

```
terraform-api-gateway-lambda-auth
├── src
│   ├── main.tf                # Main Terraform configuration file
│   ├── variables.tf           # Input variables for customization
│   ├── outputs.tf             # Output values after deployment
│   ├── api_gateway.tf         # API Gateway configuration
│   ├── lambda.tf              # Lambda function configuration
│   ├── rds.tf                 # RDS instance configuration
│   └── modules
│       ├── api_gateway
│       │   └── main.tf        # API Gateway module
│       ├── lambda
│       │   └── main.tf        # Lambda module
│       └── rds
│           └── main.tf        # RDS module
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
   - Edit `variables.tf` to set your desired configurations such as region, instance types, and database credentials.

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

- The API Gateway will expose endpoints for user authentication.
- The Lambda function will handle the authentication logic and interact with the RDS database.

## Notes

- Ensure that your Lambda function has the necessary permissions to access the RDS instance.
- Monitor the AWS console for logs and metrics related to the API Gateway and Lambda function for troubleshooting.

## License

This project is licensed under the MIT License.