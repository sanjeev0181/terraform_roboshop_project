module "vpc" {
  source = "../../terraform-modules/vpc"
  #cidr = "10.1.0.0/16"
  tags = var.tags
  igw_tags = var.igw_tags
  public_subnets_tags = var.public_subnets_tags
  private_subnets_tags = var.private_subnets_tags
  public_rt_tags = var.public_rt_tags
  nat_tags = var.nat_tags
  private_rt_tags = var.private_rt_tags
  db_subnets_tags = var.db_subnets_tags
}

#As a user you want to create security group

resource "aws_security_group" "web" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "timing-web"
  }
}