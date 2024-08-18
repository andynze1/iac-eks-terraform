output "jenkins_server_ip" {
  description = "The IP of the Build Server."
  value       = aws_instance.jenkins_server.public_ip
}

output "debug_security_group" {
  value = var.security_group_id
}

output "aws_instance_id" {
  value = aws_instance.jenkins_server.id
}

output "eks_admins_iam_role_arn" {
  value = aws_iam_role.eks_admin.arn
}

output "eks_admins_iam_role_name" {
  value = aws_iam_role.eks_admin.name
}

output "instance_type" {
  value = aws_instance.jenkins_server.instance_type
}

output "ami_id_ubuntu" {
  value = aws_instance.jenkins_server.ami
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}