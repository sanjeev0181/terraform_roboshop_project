#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "automated-vpc"
  }
}

#subents
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id  #if will fetch VPCID created form above code.
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnets-automated-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id  #if will fetch VPCID created form above code.
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnets-automated-vpc"
  }
}


#internet gateway
#https://registry.terraform.io/providers/hashicorp/aws/3.6.0/docs/resources/internet_gateway

resource "aws_internet_gateway" "automated-igw" {
  vpc_id = aws_vpc.main.id  #internet gateway depends of VPC

  tags = {
    Name = "automated-igw"
  }
}

#Route Tables
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.automated-igw.id
  }

   tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt" {  #for private route we don't attach IGW, we attach NAT
    vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }

   tags = {
    Name = "private-rt"
  }
}

#Elastic ip
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "auto_elb" {

}

#NAT Gateway
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.auto_elb.id
  subnet_id     = aws_subnet.public.id #public ip

  tags = {
    Name = "automated-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.automated-igw]
}

#route table association terraform
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private .id
  route_table_id = aws_route_table.private-rt.id
}