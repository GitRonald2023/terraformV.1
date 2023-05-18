# Creacion de VPC
resource "aws_vpc" "VPCBootCamp" {
  cidr_block           = var.cidr-vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "VPCBootCamp"
  }
}