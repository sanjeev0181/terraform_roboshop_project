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
  cidr_block =  "172.0.1.0/24"
  tags = var.public_subnets_tags
}


#private Subnets

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id  #if will fetch VPCID created form above code.
  cidr_block =  "172.0.2.0/24"
  tags = var.private_subnets_tags
}


#Routle tables

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags =  var.public_rt_tags
}

#Elastic IP resource

resource "aws_eip" "eip" {
  
}

#NAT Gateway 
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id
  tags = var.nat_tags
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

