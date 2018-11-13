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