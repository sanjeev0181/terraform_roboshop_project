#this will create VPC
resource "aws_vpc" "main" {
   cidr_block = var.cidr  # allowing other to overdire
   instance_tenancy = "default"
}