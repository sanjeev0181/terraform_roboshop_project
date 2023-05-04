data "aws_ami" "wliffly_ec2" {
  most_recent      = true
  owners           = ["521045274894"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "wlidfly_web"{
  #ami = "ami-046b3d63c4fe1b3cf" #AMI ID will be different every region, this is OS
  ami = data.aws_ami.wliffly_ec2.image_id 
  instance_type = "t3.medium"
}
