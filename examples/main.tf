module "main" {
  single_nat_gw = true
  source        = "../."
}

output "public_subnets" {
  value = module.main.public_subnets
}

output "private_subnets" {
  value = module.main.private_subnets
}

output "database_subnets" {
  value = module.main.database_subnets
}

output "vpc" {
  value = module.main.vpc
}

output "nat_gws" {
  value = module.main.aws_nat_gateways
}
