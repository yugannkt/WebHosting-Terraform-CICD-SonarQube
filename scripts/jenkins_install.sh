#!/bin/bash

# Update and Upgrade
sudo apt update -y && sudo apt upgrade -y 

# Install Java and Apache
sudo apt install openjdk-21-jdk -y
sudo apt-get install -y apache2 

# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key 
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list 
sudo apt-get update -y 
sudo apt-get install jenkins -y 
sudo systemctl start apache2 
sudo systemctl enable apache2 
sudo systemctl start jenkins
sudo systemctl enable jenkins 

# Grant sudo permissions to Jenkins user
echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/jenkins
