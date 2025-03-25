module "vpc" {
  source = "./networking"
}

module "cluster" {
  source          = "./cluster"
  private_network = module.vpc.private_network
}

module "node_pool_untainted" {
  source          = "./nodepool_untainted"
  clusterName     = module.cluster.clusterName
  clusterId       = module.cluster.clusterId
  purpose         = "general-services"
  suffix          = "b2-15"
  max_nodes       = 2
  min_nodes       = 1
  desired_nodes   = 1
  private_network = module.vpc.private_network
}

module "dockerregistry" {
  source = "./private_cr"
}