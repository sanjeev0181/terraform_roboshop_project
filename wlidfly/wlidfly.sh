#!/bin/bash
sudo apt update -y
sudo apt -y install default-jdk
sudo apt install curl wget -y 
wget https://github.com/wildfly/wildfly/releases/download/26.0.0.Final/wildfly-26.0.0.Final.tar.gz
tar -xf wildfly-*.Final.tar.gz
sudo mv wildfly-*Final /opt/wildlfy
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