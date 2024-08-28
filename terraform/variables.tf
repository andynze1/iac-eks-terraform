variable "cluster_name" {
  type    = string
  default = "dml-eks-cluster"
}

variable "cluster_version" {
  type    = number
  default = 1.25
}

# variable "aws_region" {
#   type    = string
#   default = "us-east-1"
# }

variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "argo_cd_version" {
  description = "The version of the Argo CD Helm chart."
  type        = string
  default     = "5.24.1"
}

variable "namespace_monitoring" {
  description = "The namespace for monitoring tools like Prometheus and Grafana."
  type        = string
  default     = "monitoring"
}

variable "namespace_argocd" {
  description = "The namespace for Argo CD."
  type        = string
  default     = "argocd"
}

variable "grafana_version" {
  description = "The version of the Grafana Helm chart."
  type        = string
  default     = "8.4.4"
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana."
  type        = string
  default     = "securepassword"
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.25.6-eksbuild.1"
    },
    {
      name    = "vpc-cni"
      version = "v1.12.2-eksbuild.1"
    },
    {
      name    = "coredns"
      version = "v1.9.3-eksbuild.2"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.23.0-eksbuild.1"
    }
  ]
}


################################
variable "public_subnet_id" {
  type    = string
  default = "module.vpc.public_subnets[0]"
}


variable "private_subnet_id" {
  type    = string
  default = "module.vpc.private_subnets"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc_id"
}

variable "security_group_id" {
  description = "VPC Security Group ID"
  type        = string
  default     = "aws_security_group.cluster_sg.id"
}

variable "aws_instance_id" {
  description = "AWS Instance ID"
  type        = string
  default     = "instance_id"
}

# variable "network_interface_id" {
#   description = "Network Interface ID"
#   type        = string
# }

variable "ami_id_ubuntu" {
  description = "AMI ID for Ubuntu"
  type        = string
  default     = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t3.large"
}

variable "name" {
  type    = string
  default = "dml-demo"
}

variable "linux-keypair" {
  type    = string
  default = "linux-key"
}


variable "security_group_rules" {
  description = "Security group rules"
  type = list(object({
    name        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      name        = "SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      name        = "HTTP access"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      name        = "HTTPS access"
      from_port   = 9443
      to_port     = 9443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      name        = "App Port 8081"
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      name        = "App Port 8080"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      name        = "App Port 9000"
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file."
  type        = string
  default     = "~/.kube/config"
}