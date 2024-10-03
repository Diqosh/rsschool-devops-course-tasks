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

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]

  tags = {
    Name = "Subnet-${count.index + 1}"
    Type = count.index < 2 ? "Public" : "Private"
  }
}

# first public subnet, first availability zone
# second public subnet, second availability zone
# third private subnet, first availability zone
# fourth private subnet, second availability zone

