resource "aws_instance" "web"{

    #ami = "ami-046b3d63c4fe1b3cf" #AMI ID will be different every region, this is OS
    ami = "ami-0dfe34254aac43e0c"
    instance_type = "t3.micro"
    #count = 3  #our requirement is to create 
    count = lenght(var.instances)
    tags = {
        #Name = "WEB-${count.index}"
        Name = var.instance[count.index] #index always  start from 0.if start
    }   
}


# condition is if variable of key is defined then use that, other wise use dafult key


# resource "aws_instance" "web-1"{
#     ami = "ami-022d03f649d12a49d" #AMI ID will be different every region, this is OS
#     instance_type = "t3.micro"
#     count = 0 #if count equal to zero terraform will not create the resource
# }

# resource "aws_instance" "web-1"{
#     ami = "ami-022d03f649d12a49d" #AMI ID will be different every region, this is OS
#     instance_type = var.is_test ? "t3.micro" : "t3.large"
# }

# resource "aws_instance" "server"{
#     for_each = var.servers #here you need to give a map to iterate
#     ami = "ami-022d03f649d12a49d" #AMI ID will be different every region, this is OS
#     instance_type = each.value
#     tags = {
#       Name = each.key
#     }
# }

# }

resource "aws_instance" "server"{
    ami = "ami-022d03f649d12a49d" #AMI ID will be different every region, this is OS
    instance_type = "t3.micro"
    tags = {
      Name = local.instance_name
    }
}
