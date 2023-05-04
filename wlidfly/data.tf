
resource "aws_instance" "wlidfly_web"{
  ami = "ami-007855ac798b5175e" #AMI ID will be different every region, this is OS
  instance_type = "t3.medium"
  key_name = "ajith-keys"
  user_data = "${file("bash wlidfly.sh")}"
}

