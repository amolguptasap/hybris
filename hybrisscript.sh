#!/bin/bash
su
apt update
echo "***************************************************************"
echo "starting basic apt installs"
echo "***************************************************************"
apt install sudo
apt install vim
apt install dirmngr
apt install gksu

echo "***************************************************************"
echo "fixing display scaling issue"
echo "***************************************************************"
apt-get install build-essential module-assistant
m-a prepare

#echo "running the Linux Additions. NOTE: the iso should be mounted in the virtual cd device. Device ->... menu"
#sudo sh /media/cdrom0/VBoxLinuxAdditions.run

echo "***************************************************************"
echo "installing Java 8"
echo "***************************************************************"
#sudo vim /etc/apt/sources.list.d/java-8-debian.list

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/java-8-debian.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

apt update
apt install oracle-java8-installer

echo "***************************************************************"
echo "set java 8 as default"
echo "***************************************************************"
apt install oracle-java8-set-default

echo "***************************************************************"
echo "set JAVA_HOME" 
echo "***************************************************************"
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" > /etc/environment
echo "export JAVA_HOME" >> /etc/environment

. /etc/environment

echo "***************************************************************"
echo "Java Version"
echo "***************************************************************"
java -version

echo "***************************************************************"
echo "Javac Version"
echo "***************************************************************"
javac -version

echo "***************************************************************"
echo "installing MYSQL"
echo "***************************************************************"
apt update
apt upgrade

wget http://repo.mysql.com/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb

sudo apt update 
sudo apt install mysql-server

echo "Starting/restarting Mysql server"
sudo systemctl restart mysql

echo "***************************************************************"
echo "logging in MYSQL"
echo "e.g. show databases;"
echo "e.g. create database hybris"
echo "***************************************************************"
mysql -u root -p


sudo /etc/init.d/mysql stop
echo "***************************************************************"
echo "END OF SCRIPT"
echo "***************************************************************"

#./install.sh -r b2b_acc
#./install.sh -r b2b_acc initialize
#./install.sh -r b2b_acc start

#./install.sh -r b2c_acc initialize



