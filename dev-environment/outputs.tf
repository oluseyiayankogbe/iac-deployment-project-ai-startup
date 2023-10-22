output "vpc_id" {
  value = module.networking-dns-ecs-rds-s3.vpc_id
}

output "vpc_cidr" {
  value = module.networking-dns-ecs-rds-s3.vpc_cidr
}

/*
output "public-subnets-web_id" {
  value = module.networking-dns-ecs.public-subnets-web_id
}

output "private-subnets-app_id" {
  value = module.networking-dns-ecs.private-subnets-app_id
}

output "private-subnets-data_id" {
  value = module.networking-dns-ecs.private-subnets-data_id
}

output "security-group_id" {
  value = module.networking-dns-ecs.security-group_id
}

*/

output "lb-target-group_arn" {
  value = module.networking-dns-ecs-rds-s3.lb-target-group_arn
}

output "load-balancer_dns_name" {
  value = module.networking-dns-ecs-rds-s3.load-balancer_dns_name
}

output "load-balancer_zone_id" {
  value = module.networking-dns-ecs-rds-s3.load-balancer_zone_id
}


