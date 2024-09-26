terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "remote_backend" {
  bucket = "remote-backend-rschool-2024q3"
}

resource "aws_dynamodb_table" "remote_backend" {
  name         = "remote-backend-rschool-2024q3"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}