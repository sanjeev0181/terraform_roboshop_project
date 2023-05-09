#This will create vpc
resource "aws_vpc" "main" {
  #cidr_block = var.cidr
  cidr_block = locals.cidr
  instance_tenancy =  "default"
}