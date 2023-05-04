
resource "aws_instance" "wlidfly_web"{
  ami = "ami-007855ac798b5175e" #AMI ID will be different every region, this is OS
  instance_type = "t3.medium"
  key_name = "ajith-keys"
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt update -y",
  #     "sudo apt install -y git",
  #     "sudo git clone https://github.com/sanjeev0181/terraform_roboshop_project.git",
  #     "cd terraform_roboshop_project/wlidfly",
  #     "bash wlidfly.sh",
  #   ]
  # }
  user_data = "${file("bash /root/terraform_roboshop_project/wlidfly/wlidfly.sh")}"
}

