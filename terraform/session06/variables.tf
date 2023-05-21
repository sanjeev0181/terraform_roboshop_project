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