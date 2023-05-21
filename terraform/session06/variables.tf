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
        Name = "public_rt-timing"  #resourcename-projectname
        Environment = "DEV"
        Terraform  = "true"
    }
}