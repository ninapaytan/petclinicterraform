module "network" {
  source = "../../modules/aws/network"
}

module "security-groups" {
  source = "../../modules/aws/security-groups"
  vpc-terraform = module.network.vpc-terraform-id
}