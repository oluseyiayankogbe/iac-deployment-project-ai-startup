#0. Create ECS Cluster

resource "aws_ecs_cluster" "cluster" {
  name = local.cluster_name
}