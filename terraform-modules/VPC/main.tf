#This will create vpc
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  instance_tenancy =  "default"
}