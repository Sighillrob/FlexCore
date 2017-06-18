#Apache and Cert 

yum update -y
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=permissive/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
yum install httpd -y
yum install mod_ldap -y 
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum install mod_ssl -y
yum -y install yum-utils
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum install python-certbot-apache -y
sudo systemctl enable httpd

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

rpm -ivh jdk-8u131-linux-x64.rpm 

wget http://www-eu.apache.org/dist//directory/apacheds/dist/2.0.0-M23/apacheds-2.0.0-M23-x86_64.rpm

rpm -ivh apacheds-2.0.0-M23-x86_64.rpm

wget http://products.accusoft.com/PrizmDoc/12.1/prizmdoc_client_12.1.x86_64.rpm.tar.gz

tar -xzvf prizmdoc_client_12.1.x86_64.rpm.tar.gz 
cd prizmdoc_client_12.1.0.75.x86_64.rpm/
yum install --nogpgcheck *.rpm -y


mkdir /opt/flex
mkdir /opt/flex/documents
mkdir /opt/start/

cd /etc/init.d/
service apacheds-2.0.0_M23-default start

cd /root/
sudo yum install postgresql-server postgresql-contrib -y
sudo postgresql-setup initdb

sudo systemctl start postgresql
sudo systemctl enable postgresql


#
# Security Stuff
#
# Mod Evasive Documentation
#https://www.digitalocean.com/community/tutorials/how-to-protect-against-dos-and-ddos-with-mod_evasive-for-#apache-on-centos-7
#

sudo yum install yum-cron -y


sudo systemctl status yum-cron
sudo systemctl enable yum-cron

sudo yum install fail2ban -y
sudo systemctl enable fail2ban

sudo yum install yum-plugin-protectbase.noarch -y
sudo yum install mod_evasive -y
sudo systemctl restart httpd.service
service httpd stop 


#add FQDN for License long and short name

nano /etc/hosts

reboot

