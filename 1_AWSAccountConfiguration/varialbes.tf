variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for remote backend"
  type        = string
  default     = "remote-backend-rschool-2024q3-test"
}

