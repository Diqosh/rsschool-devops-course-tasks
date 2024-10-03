terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  backend "s3" {
    bucket         = "remote-backend-rschool-2024q3"
    key            = "terraform.tfstate"
    dynamodb_table = "remote-backend-rschool-2024q3"
    region         = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2_instances" {
  source       = "./modules/ec2_instance"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  subnet_types = concat(["public", "public"], ["private", "private"])
  ami_id       = var.ami_id
  key_name     = var.key_name
}