# Datasource: AWS Partition
# Use this data source to lookup information about the current AWS partition in which Terraform is working

# # Resource: AWS IAM Open ID Connect Provider
# resource "aws_iam_openid_connect_provider" "oidc_provider" {
#   url             = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
#   client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"] # ["sts.amazonaws.com"]
#   thumbprint_list = [data.external.oidc_thumbprint.result.thumbprint]
#   # thumbprint_list = ["9451AD2B53C7F41FAB22886CC07D482085336561"]
#   tags = merge(
#     {
#       Name = "${var.cluster_name}-eks-irsa"
#     },

#   )
# }

# Output: AWS IAM Open ID Connect Provider ARN
output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value       = module.eks.oidc_provider_arn
}

# Extract OIDC Provider from OIDC Provider ARN
locals {
  aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${module.eks.oidc_provider_arn}"), 1)
}

# Output: AWS IAM Open ID Connect Provider
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}

# Sample Outputs for Reference
/*
aws_iam_openid_connect_provider_arn = "arn:aws:iam::180789647333:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/A9DED4A4FA341C2A5D985A260650F232"
aws_iam_openid_connect_provider_extract_from_arn = "oidc.eks.us-east-1.amazonaws.com/id/A9DED4A4FA341C2A5D985A260650F232"
*/

# Input Variables - AWS IAM OIDC Connect Provider


# EKS OIDC ROOT CA Thumbprint - valid until 2037
variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "9451AD2B53C7F41FAB22886CC07D482085336561"
}