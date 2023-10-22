output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public-subnets_web_id" {
  value = aws_subnet.public-subnets-web[*]
}



output "private-subnets_app_id" {
  value = aws_subnet.private-subnets-app[*]
}


output "private-subnets_data_id" {
  value = aws_subnet.private-subnets-data[*]
}



output "security-group_id" {
  value = aws_security_group.sg.id
}

output "lb-target-group_arn" {
  value = aws_lb_target_group.lb-target-group.arn
}

output "load-balancer_dns_name" {
  value = aws_lb.load-balancer.dns_name
}

output "load-balancer_zone_id" {
  value = aws_lb.load-balancer.zone_id
}



