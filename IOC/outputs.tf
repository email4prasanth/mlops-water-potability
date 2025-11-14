output "ec2_public_ip" {
  value = aws_instance.public-web-server-1.public_ip
}

output "ec2_user" {
  value = "ubuntu" # or dynamic based on AMI
}

output "ecr_repository" {
  value = aws_ecr_repository.mlops_water_potability.name
}

output "docker_image_name" {
  value = "water-potability-app"
}
# Output the ECR repository URL
output "ecr_repository_url" {
  value       = aws_ecr_repository.mlops_water_potability.repository_url
  description = "The URL of the ECR repository"
}