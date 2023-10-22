
module "networking-dns-ecs-rds-s3" {
  source = "../child-modules/networking-dns-ecs-rds-s3"

 

  #vpc atttributes
  project_name         = var.project_name
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  #subnet attributes
  descriptor1                                 = var.descriptor1
  descriptor2                                 = var.descriptor2
  descriptor3                                 = var.descriptor3
  public_subnets_web_cidr                         = var.public_subnets_web_cidr
  private_subnets_app_cidr                        = var.private_subnets_app_cidr
  private_subnets_data_cidr                        = var.private_subnets_data_cidr
  availability_zone                           = var.availability_zone
  map_public_ip_on_launch                     = var.map_public_ip_on_launch
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch
  instance_tenancy                            = var.instance_tenancy
  
  associate_public_ip_address = var.associate_public_ip_address
  #dbsubnetgroup attributes
  name = var.name
  #rds postgresql database attributes
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  #username              = var.username
  #password              = var.password
  parameter_group_name  = var.parameter_group_name
  skip_final_snapshot   = var.skip_final_snapshot
  db_subnet_group_name  = var.db_subnet_group_name
  #ECR Attributes
  repository_name       = var.repository_name 
  image_tag             = var.image_tag 
  #Route53 Attributes
  root_domain_name = var.root_domain_name
  sub_domain_name = var.sub_domain_name
  #s3 atrributes
  s3_prefix = var.s3_prefix
  acl       = "private"
  #role         = "${var.project_name}-ecsTaskExecutionRole"
  #role         = "${var.project_name}-ecsAutoscaleRole"
}

module "key-pair" {
  source       = "../child-modules/key-pair"
  project_name = var.project_name
}


/*
module "ecs-task-execution-role" {
  source       = "../child-modules/ecs-task-execution-role"
  project_name = var.project_name
  role         = "${var.project_name}-ecsTaskExecutionRole"

}

module "ecs-autoscale-role" {
  source       = "../child-modules/ecs-autoscale-role"
  project_name = var.project_name
  role         = "${var.project_name}-ecsAutoscaleRole"

}
*/

/*
module "s3-bucket" {
  source    = "../child-modules/s3-bucket"
  s3_prefix = "aiproject"
  acl       = "private"

}
*/


