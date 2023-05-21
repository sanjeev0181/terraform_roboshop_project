variable "tags" {
    default = {
        Name = "timing"
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "igw_tags" {
    default = {
        Name = "timing-igw" #don't repeat resourceName itself.
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "public_subnets_tags" {
    default = {
        Name = "public_subnet-timing"  #resourcename-projectname
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "private_subnets_tags" {
    default = {
        Name = "private_subnet-timing"  #resourcename-projectname
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "public_rt_tags" {
    default = {
        Name = "public_rt-timing"  
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "nat_tags" {
    default = {
        Name = "nat-timing"  
        Environment = "DEV"
        Terraform  = "true"
    }
}

#private_rt_tags

variable "private_rt_tags" {
    default = {
        Name = "private-rt-timing"  
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "db_subnets_tags" {
    default = {
        Name = "db-subnet-timing"  
        Environment = "DEV"
        Terraform  = "true"
    }
}