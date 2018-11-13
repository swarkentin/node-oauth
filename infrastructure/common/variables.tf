/* Terraform constraints */
terraform {
    required_version = ">= 0.11, < 0.12"
}

variable "name_prefix" {
    default = "node-oauth"
    description = "Name prefix for this environment."
}

variable "aws_region" {
    default = "us-west-2"
    description = "Determine AWS region endpoint to access."
}

/**
  * NOTE: Different AWS account may have different availability zones.
  */
variable "subnet_azs" {
    description = "Subnet AZ, separated by comma. Default is \"a,b\". Please check your available AZ before specifying this value."
    default = "a,b,c"
}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
}

