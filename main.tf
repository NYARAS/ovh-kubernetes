module "vpc" {
  source = "./networking"
}

module "cluster" {
  source          = "./cluster"
  private_network = module.vpc.private_network
}

