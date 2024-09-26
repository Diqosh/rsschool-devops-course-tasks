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

resource "aws_s3_bucket" "remote_backend" {
  bucket = var.s3_bucket_name
}


