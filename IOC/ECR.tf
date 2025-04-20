# Create ECR repository for mlops-water-potability
resource "aws_ecr_repository" "mlops_water_potability" {
  name                 = "mlops-water-potability" # Repository name
  image_tag_mutability = "MUTABLE"                # Allows image tags to be overwritten

  image_scanning_configuration {
    scan_on_push = true # Enable scanning of images when pushed
  }

  tags = merge(
    local.tags,
    {
      Name = "mlops-water-potability-ecr"
    }
  )
}

# Output the ECR repository URL
output "ecr_repository_url" {
  value       = aws_ecr_repository.mlops_water_potability.repository_url
  description = "The URL of the ECR repository"
}