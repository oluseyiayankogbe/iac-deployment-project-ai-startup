#vpc attributes
variable "region" {}
variable "project_name" {}
variable "enable_dns_hostnames" {}
variable "enable_dns_support" {}
#subnet attributes
variable "descriptor1" {}
variable "descriptor2" {}
variable "descriptor3" {}
variable "vpc_cidr" {}
variable "availability_zone" {}
variable "public_subnets_web_cidr" {}
variable "private_subnets_app_cidr" {}
variable "private_subnets_data_cidr" {}
variable "map_public_ip_on_launch" {}
variable "enable_resource_name_dns_a_record_on_launch" {}
variable "instance_tenancy" {}
variable "associate_public_ip_address" {}
#dbsubnetgroup attributes
variable "name" {}
#rds database attributes
variable "allocated_storage" {}
variable "max_allocated_storage" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_name" {}
variable "parameter_group_name" {}
variable "skip_final_snapshot" {}
variable "db_subnet_group_name" {}
variable "repository_name" {}
variable "image_tag" {}
variable "root_domain_name" {}
variable "sub_domain_name" {}
#s3 attributes
variable "s3_prefix" {}
variable "acl" {}
#variable "role" {}



