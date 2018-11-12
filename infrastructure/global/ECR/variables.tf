variable "ecr-repository-name" {
  description = "The name of the ECS docker repository"
  default = "node-oauth"
}

variable "profile" {
  description = "AWS profile"
}

variable "region" {
  description = "AWS Region"
}