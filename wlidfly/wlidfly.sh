# #!/bin/bash -v
# sudo apt update -y
# sudo apt -y install default-jdk
# sudo apt install curl wget -y 
# wget https://github.com/wildfly/wildfly/releases/download/26.0.0.Final/wildfly-26.0.0.Final.tar.gz
# tar -xf wildfly-*.Final.tar.gz
# sudo mv wildfly-*Final /opt/wildlfy
# sudo groupadd --system wildfly
# sudo useradd -s /sbin/nologin --system -d /opt/wildfly  -g wildfly wildfly
# sudo mkdir /etc/wildfly
# sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
# sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
# sudo cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
# sudo chmod +x /opt/wildfly/bin/launch.sh
# sudo chown -R wildfly:wildfly /opt/wildfly
# sudo systemctl daemon-reload
# sudo systemctl start wildfly
# sudo systemctl enable wildfly
# sudo systemctl status wildfly

#!/bin/bash -v
### Install base depenedencies. We should use Packer to build a base image instead
# apt-get update -y
# apt-get install -y nginx >> /tmp/install.log
# apt-get install -y openjdk-7-jdk >> /tmp/install.log

# cd /tmp
# wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
# tar xfvz jboss-as-7.1.1.Final.tar.gz
# mv jboss-as-7.1.1.Final /usr/local/share/jboss
# adduser appserver
# chown -R appserver /usr/local/share/jboss

# echo "Completed Install." >> /tmp/install.log

# # Start the JBoss server
# su - appserver -c '/usr/local/share/jboss/bin/standalone.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 &'

sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
sudo mkdir /opt/jboss
sudo wget https://developers.redhat.com/content-gateway/file/eap/8.4_Beta/jboss-eap-8.0.0.Beta.zip
sudo tar -xvf jboss-eap-8.0.0.zip -C /opt/jboss/
 
#/etc/systemd/system/jboss.service
cp jboss.service /etc/systemd/system/jboss.service
 

sudo useradd -r -s /bin/false jboss
sudo chown -R jboss:jboss /opt/jboss

sudo systemctl daemon-reload
sudo systemctl enable jboss.service
sudo systemctl start jboss.service
