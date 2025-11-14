# User data for initial configuration
data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = file("./customdata.tpl")
  }
}

# Create EC2 instance
resource "aws_instance" "public-web-server-1" {
  ami               = local.server
  availability_zone = local.avail_zone
  instance_type     = "t2.micro"
  # instance_type               = "t2.small" 
  key_name                    = local.Key_name
  subnet_id                   = aws_subnet.mlops-pub_subnet1.id
  vpc_security_group_ids      = [aws_security_group.mlops_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "${local.project_name.name}-server-${terraform.workspace}"
  }

  # root_block_device {
  #   volume_size = 8  # Minimum recommended for Ubuntu 22.04 (default is 8GB)
  #   volume_type = "gp3"
  # }
}