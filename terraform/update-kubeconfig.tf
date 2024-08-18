resource "null_resource" "update_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.aws_region} --kubeconfig ${var.kubeconfig_path}"
  #  command = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.aws_region} --kubeconfig ${var.kubeconfig_path}"
  }

  triggers = {
    cluster_name = var.cluster_name
  }

  depends_on = [module.eks]  # Ensure cluster is created before updating kubeconfig
}