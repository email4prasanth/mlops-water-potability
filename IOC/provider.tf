# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
  #   shared_credentials_files = ["~/.aws/credentials"]  # Path to AWS credentials
  profile = "tut" # Profile name
}
# Backend tf files to store in S3 bucket
terraform {
  backend "s3" {
    bucket  = "mlopstfstore"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "tut"
  }
}
