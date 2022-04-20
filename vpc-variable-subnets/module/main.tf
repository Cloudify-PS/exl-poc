module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]

  enable_nat_gateway = false
  enable_vpn_gateway = false

}

# The two locals here are necessary due to the way looping works in Terraform
## subnet_mask_list just creates a tuple of all subnet masks that can be fed to subnet_cidrs
## subnet_cidrs performs the actual calculation of the CIDRs
locals {
  subnet_mask_list = [for i in range(var.number_of_subnets) : 32 - var.subnet_mask]
  subnet_cidrs     = cidrsubnets(var.vpc_cidr, local.subnet_mask_list...)
}

resource "aws_subnet" "subnets" {
  count             = var.number_of_subnets
  vpc_id            = module.vpc.vpc_id
  cidr_block        = local.subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % 2]

  tags = {
    Name = "${var.vpc_name}-${count.index}"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
