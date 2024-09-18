terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


module "aws_vpc" {
    source = "./modules/vpc"
    vpc_cidr = local.vpc_cidr
    vpc_tags = var.vpc_tags
    az = local.az
    public_subnet = local.public_subnet
    IG_tags = var.igw_tags
}

module "aws_instance" {
  source = "./modules/ec2"
  ami_id = local.ami_id
  instance_type = local.instance_type
  key_name = local.key_name
  public_subnet = module.aws_vpc.public_subnets
  vpc_id = module.aws_vpc.vpc_id
}