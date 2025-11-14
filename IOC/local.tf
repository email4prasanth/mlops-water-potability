locals {
  aws_region = "us-east-1"
  tags = {
    owner       = "mlops"
    environment = terraform.workspace
  }
  project_name = {
    name = "mlops"
  }
  Key_name = "DevOpsKey"

  cidr_ranges = {
    "dev" = "10.1.0.0/16"
  }
  vpc_cidr = lookup(local.cidr_ranges, terraform.workspace)

  az = {
    "dev" = "us-east-1a"
  }
  avail_zone = lookup(local.az, terraform.workspace)

  # Security Groups rules for VM 
  security_group_rules = {
    "dev" = [
      {
        type        = "ingress"
        description = "Allow all inbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        type        = "egress"
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  sg = lookup(local.security_group_rules, terraform.workspace)

  ami = {
    # "dev" = "ami-0f9de6e2d2f067fca" # Ubuntu 22.04 LTS in us-east-1 (64-bit (x86))
    "dev" = "ami-0ecb62995f68bb549" # Ubuntu 24.04 LTS in us-east-1 (64-bit (x86))
  }
  server = lookup(local.ami, terraform.workspace)
}