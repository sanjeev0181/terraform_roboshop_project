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