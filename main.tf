module "iam" {
  source        = "./modules/iam"
  iam_user_name = "Prasanna-user"  # Existing IAM user
  account_id    = "491085415494"  # Replace with your actual AWS account ID
}

module "vpc" {
  source             = "./modules/vpc"
  availability_zones = var.availability_zones
  vpc_cidr_block     = var.vpc_cidr_block
}

module "ec2" {
  source                 = "./modules/ec2"
  public_subnet_id       = module.vpc.public_subnet_ids[0]   # First public subnet ID
  private_subnet_id      = module.vpc.private_subnet_ids[0]  # First private subnet ID
  vpc_security_group_ids = [module.vpc.security_group_id]    # Security Group ID as a list
  key_name               = var.key_name
}

