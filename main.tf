module "iam" {
  source        = "./modules/iam"
  iam_user_name = "Prasanna-user"  # Existing IAM user
  account_id    = "491085415494"  # Replace with your actual AWS account ID
}

# VPC Module
module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  availability_zones = var.availability_zones
}

# EC2 Module
module "ec2" {
  source            = "./modules/ec2"
  public_subnet_id  = module.vpc.public_subnet_ids[0]  # First public subnet
  private_subnet_id = module.vpc.private_subnet_ids[0] # First private subnet
  vpc_security_group_ids = module.vpc.security_group_id
}
