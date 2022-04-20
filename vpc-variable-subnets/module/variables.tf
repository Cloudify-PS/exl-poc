variable "region" {
  type        = string
  description = "Name of the AWS region to deploy VPC into"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "example-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR address for the VPC"
  default     = "10.0.0.0/16"
}

variable "number_of_subnets" {
  type        = number
  description = "The number of subnets to create"
  default     = 4
}

variable "subnet_mask" {
  type        = number
  description = "The subnet mask to use for created subnets"
  default     = 24
}
