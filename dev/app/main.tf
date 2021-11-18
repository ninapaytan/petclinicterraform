module "network" {
  source = "../../modules/aws/network"
}

module "security-groups" {
  source = "../../modules/aws/security-groups"
  vpc-terraform = module.network.vpc-terraform-id
}

module "compute" {
  source = "../../modules/aws/compute"
  sn-a-public = module.network.sn-a-public-id
  sn-b-public = module.network.sn-b-public-id
  sn-a-private = module.network.sn-a-private-id
  sn-b-private = module.network.sn-b-private-id
  port22-8080-sg = module.security-groups.port22-8080-sg-id
}