resource "aws_instance" "web"{

    #ami = "ami-046b3d63c4fe1b3cf" #AMI ID will be different every region, this is OS
    ami = data.aws_ami.example.image_id
    instance_type = "t3.micro"
    
}
