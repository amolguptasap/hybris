#!/bin/bash
su
apt update

echo "starting basic apt installs"
apt install sudo
apt install vim
apt install dirmngr
apt install gksu

echo "fixing display scaling issue"
apt-get install build-essential module-assistant
m-a prepare

#echo "running the Linux Additions. NOTE: the iso should be mounted in the virtual cd device. Device ->... menu"
#sudo sh /media/cdrom0/VBoxLinuxAdditions.run

echo "installing Java 8"
#sudo vim /etc/apt/sources.list.d/java-8-debian.list

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/java-8-debian.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

apt update
apt install oracle-java8-installer

echo "set java 8 as default"
apt install oracle-java8-set-default

echo "set JAVA_HOME" 
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" > /etc/environment
echo "export JAVA_HOME" >> /etc/environment

. /etc/environment

echo "Java Version"
java -version

echo "Javac Version"
javac -version

echo "installing MYSQL"
apt update
apt upgrade

wget http://repo.mysql.com/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb

sudo apt update 
sudo apt install mysql-server

echo "Starting/restarting Mysql server"
sudo systemctl restart mysql

echo "logging in MYSQL"
echo "e.g. show databases;"
echo "e.g. create database hybris"
mysql -u root -p


sudo /etc/init.d/mysql stop

echo "END OF SCRIPT"


./install.sh -r b2b_acc
./install.sh -r b2b_acc initialize
./install.sh -r b2b_acc start

./install.sh -r b2c_acc initialize



