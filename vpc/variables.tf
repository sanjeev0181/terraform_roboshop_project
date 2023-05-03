variable "cidr" {
    type = string
}

variable "public_subnets_cidr" {
  type = string

}

variable "private_subnets_cidr" {
    type = string
}

variable "internet_cidr" {
    type = string
}

variable "private_subnets_cidr" {
    type = string
}


variable "tags" {
  type = map
}

variable "internet" {
    type = bool 
}

variable "lb_type" {
    type = string
}

variable "subents_ids" {
    type = list
}

variable "security_groups" {
    type = list
}

variable "timeout" {
    type = number
}