
#vpc atttributes
project_name         = "aistartupdev"
region               = "us-west-1"
vpc_cidr             = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support   = true

#subnet attributes
descriptor1                                 = "dev-web"
descriptor2                                 = "dev-app"
descriptor3                                 = "dev-data"
public_subnets_web_cidr                         = ["10.0.51.0/24", "10.0.52.0/24"]
private_subnets_app_cidr                        = ["10.0.53.0/24", "10.0.54.0/24"]
private_subnets_data_cidr                       = ["10.0.55.0/24", "10.0.56.0/24"]
availability_zone                           = ["us-west-1b", "us-west-1c"]
map_public_ip_on_launch                     = true
enable_resource_name_dns_a_record_on_launch = true
instance_tenancy                            = "default"
associate_public_ip_address = true

#dbsubnetgroup attributes
name = "dbsng"

#rds database attributes
allocated_storage     = 20
max_allocated_storage = 100
engine                = "postgres"
engine_version        = "14.7"
instance_class        = "db.t3.micro"
db_name               = "dbtest"
parameter_group_name  = "default.postgres14"
skip_final_snapshot   = true
db_subnet_group_name  = "dbsng"
#ECR Attributes
repository_name       = "juno-project-image"
image_tag             = "version2"
#Route53 Attributes
root_domain_name = "junoeducative.com"
sub_domain_name = "dev"

#s3 attributes
s3_prefix= "aiproject"
acl = "private"








