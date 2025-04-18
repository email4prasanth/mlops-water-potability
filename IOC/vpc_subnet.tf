# Create a VPC
resource "aws_vpc" "mlops-vpc" {
  cidr_block           = local.vpc_cidr
  enable_dns_hostnames = true #To display IPv4 DNS
  tags = {
    Name = "${local.project_name.name}-vpc-${terraform.workspace}"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/2.41.0/docs/resources/subnet
resource "aws_subnet" "mlops-pub_subnet1" {
  vpc_id            = aws_vpc.mlops-vpc.id
  cidr_block        = cidrsubnet(local.vpc_cidr, 8, 1)
  availability_zone = local.avail_zone
  tags = {
    Name = "${local.project_name.name}-pub-sub-${terraform.workspace}"
  }
}