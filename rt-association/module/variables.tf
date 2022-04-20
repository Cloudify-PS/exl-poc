variable "region" {
  type        = string
  description = "Name of the AWS region to deploy VPC into"
  default     = "us-east-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with routing table"
}

variable "route_table_id" {
  type        = string
  description = "ID of the route table to associate subnets with"
}
