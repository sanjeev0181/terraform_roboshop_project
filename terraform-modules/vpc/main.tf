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

#public subnets

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id  #if will fetch VPCID created form above code.
  cidr_block =  "10.0.1.0/24"
  tags = var.public_subnets_tags
}


#public Subnets
