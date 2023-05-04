
resource "aws_instance" "wlidfly_web"{
  ami = "ami-007855ac798b5175e" #AMI ID will be different every region, this is OS
  instance_type = "t3.medium"
  key_name = "ajith-key"
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt -y install default-jdk
  sudo apt install curl wget -y 
  WILDFLY_RELEASE=$(curl -s https://api.github.com/repos/wildfly/wildfly/releases/latest|grep tag_name|cut -d '"' -f 4)
  wget https://github.com/wildfly/wildfly/releases/download/${WILDFLY_RELEASE}/wildfly-${WILDFLY_RELEASE}.tar.gz
  tar xvf wildfly-${WILDFLY_RELEASE}.tar.gz
  sudo mv wildfly-${WILDFLY_RELEASE} /opt/wildfly
  sudo groupadd --system wildfly
  sudo useradd -s /sbin/nologin --system -d /opt/wildfly  -g wildfly wildfly
  sudo mkdir /etc/wildfly
  sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
  sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
  sudo cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
  sudo chmod +x /opt/wildfly/bin/launch.sh
  sudo chown -R wildfly:wildfly /opt/wildfly
  sudo systemctl daemon-reload
  sudo systemctl start wildfly
  sudo systemctl enable wildfly
  sudo systemctl status wildfly
  EOF
}

