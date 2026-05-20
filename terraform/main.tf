module "network" {
  source   = "./modules/network"
  app_port = var.app_port
}

module "compute" {
  source               = "./modules/compute"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  security_group_id    = module.network.security_group_id
  iam_instance_profile = var.iam_instance_profile
  app_port             = var.app_port
}