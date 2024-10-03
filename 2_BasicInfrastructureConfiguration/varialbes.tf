variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones to use for the subnets"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instances"
  default     = "ami-08d8ac128e0a1b91c"
}

variable "key_name" {
  description = "Name of the key pair to use for the EC2 instances"
  default     = "macos"
}