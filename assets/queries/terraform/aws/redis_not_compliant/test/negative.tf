#this code is a correct code for which the query should not find any result
resource "aws_elasticache_cluster" "negative_example" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "5.0.0"
  port                 = 6379
}