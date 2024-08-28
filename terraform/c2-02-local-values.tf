# Define Local Values in Terraform
locals {
  owners      = var.business_divsion
  environment = var.environment
  name        = "${var.business_divsion}-${var.environment}"

  common_tags = {
    Environment = local.environment
    Project     = "eks-project"
  }

  eks_cluster_name = "${local.name}-${var.cluster_name}"
}

