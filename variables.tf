variable "aws_accounts" {
    type = map {
        "us-east-1" = "521045274894"
        "ap-south-1" = ""
    }
}

#how to get value from map
# map_name("key")
# aws_accounts("ap-south-1")
