# Terraform AWS VPC Infrastructure

This project uses Terraform to create a VPC infrastructure in AWS, including public and private subnets, gateways, route tables, security groups, and EC2 instances for connectivity testing.

## Infrastructure Components

The following components are created:

- VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 instances in each subnet for connectivity testing

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials
- Basic understanding of AWS and Terraform concepts

## Testing Connectivity

EC2 instances are created in each subnet for testing purposes:

- Public instances: Can be accessed directly from your host machine
- Private instances: Can be accessed from public instances within the VPC

To test connectivity:

1. Connect to a public instance using SSH
2. From the public instance, try to connect to private instances
3. Verify internet access from both public and private instances

## Configuration

The main configuration files are:

- `main.tf`: Contains the main infrastructure configuration
- `variables.tf`: Defines input variables
- `outputs.tf`: Specifies output values

This project contains two main modules:

1. VPC Module: Responsible for creating the VPC, subnets, gateways, and route tables.
2. EC2 Module: Handles the creation of EC2 instances in both public and private subnets for testing purposes.

Modify these files and modules to customize the infrastructure according to your needs.

## Screenshots

All screenshots related to this project are provided in the `screenshot` folder. These screenshots may include visual representations of the VPC architecture, subnet configurations, and EC2 instance details.

## EC2 Instances

The EC2 instances created in this project are specifically for testing purposes. They are deployed in both public and private subnets to verify connectivity within the VPC and to the internet. These instances should not be used for production workloads.