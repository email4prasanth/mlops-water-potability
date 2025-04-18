### Powershell
1. Backend tf files to store in S3 bucket.
```sh
# Get Account ID
aws sts get-caller-identity --profile tut --query Account --output text 
# Create s3 bucket
aws s3api create-bucket --bucket mlopstfstore --region us-east-1 --acl private --profile tut
# Attach Policy to the Bucket
aws s3api put-bucket-policy --bucket mlopstfstore --profile tut --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::180294218712:root"
            },
            "Action": [
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::mlopstfstore",
                "arn:aws:s3:::mlopstfstore/*"
            ]
        }
    ]
}'
# Verify the Policy
aws s3api get-bucket-policy --bucket mlopstfstore --profile tut
```
2. Create workspace
```sh
terraform init
terraform workspace list
terraform workspace new dev
terraform fmt
terraform validate
terraform plan 
terraform apply --auto-approve
```

- Manual Verification Steps
```sh
# Verify Docker installation
docker --version
docker compose version
systemctl status docker

# Verify Python installation
python3 --version
pip3 --version
aws --version
docker network ls | grep shared_network # Network verification
ls -ld /app/backend # Directory verification
ls -l /app/backend/docker-compose.yml # Directory verification
groups adminuser | grep docker # User verification
```
# Destroy
```sh
aws s3 rb s3://mlopstfstore --force --region us-east-1 --profile tut
```
