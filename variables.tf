# variable "aws_accounts" {
#     type = map {
#         "us-east-1" = "521045274894"
#         "ap-south-1" = ""
#     }
# }

#how to get value from map
# map_name("key")
# aws_accounts["ap-south-1"]

variable "instances" {
  type = list
  default = ["web-server","app-server","db-server"]
}

# if env is test I want to create t3.micro, otherwise I want to create t3.large
variable "is_test" {
  type = bool
  default  = false
}

# web-server should be t3.micro, app-server should be t3.medium, db-server should be t3.large
variable "servers" {
  type = map
  default = {
    "web-server" = "t3.micro"
    "app-server" = "t3.medium"
    "db-server" = "t3.large"
  }
}

variable "instance_name" {
  type = string
  default = "web-server"
}

variable "environment" {
  type = string
  default = "DEV"
}
# instance name should be web-server-DEV
