variable "tags" {
    default = {
        Name = "timing"
        Environment = "DEV"
        Terraform  = "true"
    }
}

variable "igw_tags" {
    default = {
        Name = "timing-igw"
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