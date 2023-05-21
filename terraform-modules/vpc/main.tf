#this will create VPC

# resource "aws_vpc" "main" {
#    cidr_block = var.cidr  # allowing other to overdire
#    instance_tenancy = "default"
# }

resource "aws_vpc" "main" {
  cidr_block = local.cidr #You dont want users to create CIDR with differen value 
  instance_tenancy = "default"
  tags = var.tags
}


#Nat gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id  # internet gateway depends on VPC
  tags = var.igw_tags
}


#public Subnets
