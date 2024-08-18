# data "aws_subnet_ids" "public_subnets" {
#   vpc_id = module.vpc.vpc_id
#   filter {
#     name   = "tag:kubernetes.io/role/elb"
#     values = ["1"]
#   }
# }
# output "public_subnet_ids" {
#   value = data.aws_subnet_ids.public_subnets.ids
# }
