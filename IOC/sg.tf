# Create the security group
resource "aws_security_group" "mlops_sg" {
  name        = "${local.project_name.name}-sg-${terraform.workspace}"
  description = "Security group for MLOps instances"
  vpc_id      = aws_vpc.mlops-vpc.id

  dynamic "ingress" {
    for_each = [for rule in local.security_group_rules[terraform.workspace] : rule if rule.type == "ingress"]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = [for rule in local.security_group_rules[terraform.workspace] : rule if rule.type == "egress"]
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${local.project_name.name}-sg-${terraform.workspace}"
  }
}