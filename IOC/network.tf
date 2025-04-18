# https://registry.terraform.io/providers/rgeraskin/aws2/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "mlops-igw" {
  vpc_id = aws_vpc.mlops-vpc.id

  tags = {
    Name = "${local.project_name.name}-IGW-${terraform.workspace}"
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table.html
resource "aws_route_table" "mlops-pub-rt" {
  vpc_id = aws_vpc.mlops-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mlops-igw.id
  }
  tags = {
    Name = "${local.project_name.name}-MainRT-${terraform.workspace}"
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "RTA-pub" {
  subnet_id      = aws_subnet.mlops-pub_subnet1.id
  route_table_id = aws_route_table.mlops-pub-rt.id
}
