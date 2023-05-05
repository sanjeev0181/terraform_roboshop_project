resource "aws_instance" "web"{

    #ami = "ami-046b3d63c4fe1b3cf" #AMI ID will be different every region, this is OS
    ami = "ami-0dfe34254aac43e0c"
    instance_type = "t3.micro"
    
}
