
# resource "aws_instance" "wlidfly_web"{
#   ami = "ami-007855ac798b5175e" #AMI ID will be different every region, this is OS
#   instance_type = "t3.medium"
#   key_name = "ajith-keys"
#   user_data = file("${path.module}/wlidfly.sh")
# }
# #   provisioner "remote-exec" {
# #     inline = [
# #       "sudo apt update -y",
# #       "sudo apt install -y git",
# #       "sudo git clone https://github.com/sanjeev0181/terraform_roboshop_project.git",
# #       "cd terraform_roboshop_project/wlidfly/",
# #       "bash wlidfly.sh",
# #     ]
# #   }
# #   user_data = <<EOF
# #   #!/bin/bash
# #     sudo apt update -y
# #     sudo apt -y install default-jdk
# #     sudo apt install curl wget -y 
# #     wget https://github.com/wildfly/wildfly/releases/download/26.0.0.Final/wildfly-26.0.0.Final.tar.gz
# #     tar -xf wildfly-*.Final.tar.gz
# #     sudo mv wildfly-*Final /opt/wildlfy
# #     sudo groupadd --system wildfly
# #     sudo useradd -s /sbin/nologin --system -d /opt/wildfly  -g wildfly wildfly
# #     sudo mkdir /etc/wildfly
# #     sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
# #     sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
# #     sudo cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
# #     sudo chmod +x /opt/wildfly/bin/launch.sh
# #     sudo chown -R wildfly:wildfly /opt/wildfly
# #     sudo systemctl daemon-reload
# #     sudo systemctl start wildfly
# #     sudo systemctl enable wildfly
# #     sudo systemctl status wildfly
# #  EOF

 
# Launch instance with Windows Server AMI
resource "aws_instance" "windows_instance" {
  #ami           = "ami-0dfe34254aac43e0c" # cloudimg-wildfly26-windows-server2022v1.0.1-d1f39bc6-6cc7-49d7-9202-b13778c25d0c
  ami  = "ami-0bde1eb2c18cb2abe"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Win-Server-1"
  }
  
  # Other instance configuration parameters
  # ...
}

# Launch instance with Linux Server AMI
resource "aws_instance" "linux_instance" {
  #ami           = "ami-0b7beba926e1f4233" # cloudimg-jboss-eap74-alma-linux8v1.0.0-88ddbac8-96ff-42cc-bf51-3fc704eaba4f
  #ami  = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
   
  tags = {
    Name = "Linux-Server-1"
  }
  
  # Other instance configuration parameters
  # ...
}
