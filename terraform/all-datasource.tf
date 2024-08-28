data "aws_partition" "current" {}

data "aws_eks_cluster" "eks_cluster" {
  name       = module.eks.cluster_id
  depends_on = [data.aws_eks_cluster.eks_cluster]
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name       = var.cluster_name
  depends_on = [data.aws_eks_cluster.eks_cluster]
}

data "external" "oidc_thumbprint" {
  program = ["bash", "${path.module}/get_thumbprint.sh"]
}

# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}
# data "aws_caller_identity" "current" {}
