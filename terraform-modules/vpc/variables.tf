variable "cidr" {
  type = string
  default = "192.0.0.0/16"
}

variable "tags" {
    type = map
    default = {
        Name = "VPC"
    }
}

variable "igw_tags" {
  type = map
  default = {
    Name = "igw"
  }
}

variable "public_subnets_tags" {
  type = map
  default = {
    Name = "public-subnets"
  }
}

variable "private_subnets_tags" {
  type = map
  default = {
    Name = "private-subnets"
  }
}

variable "public_rt_tags" {
  type = map
  default = {
    Name = "public_rt"
  }
}

variable "nat_tags" {
  type = map
  default = {
    Name = "nat"
  }
}

#private_rt_tags

variable "private_rt_tags" {
  type = map
  default = {
    Name = "private-rt"
  }
}

variable "db_subnets_tags" {
  type = map
  default = {
    Name = "db_subnets"
  }
}