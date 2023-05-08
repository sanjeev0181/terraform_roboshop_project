#This will create vpc
resource "aws_vpc" "main" {
  cidr_block = "195.0.0.0/16"
  instance_tenancy =  "defaults"
}