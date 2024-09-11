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