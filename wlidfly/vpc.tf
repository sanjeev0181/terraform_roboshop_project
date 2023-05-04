resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "automated-vpc"
  }
}

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

resource "aws_internet_gateway" "automated-igw" {
  vpc_id = aws_vpc.main.id  #internet gateway depends of VPC
  tags = {
    Name = "automated-igw"
  }
}

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

resource "aws_eip" "auto_elb" {
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.auto_elb.id
  subnet_id     = aws_subnet.public.id #public ip
  tags = {
    Name = "automated-NAT"
  }
 
  depends_on = [aws_internet_gateway.automated-igw]
}
#route table association terraform

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private .id
  route_table_id = aws_route_table.private-rt.id
}