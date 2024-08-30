#!/bin/bash

# Install Docker
sudo apt-get update 
sudo apt-get install -y ca-certificates curl 
sudo install -m 0755 -d /etc/apt/keyrings 
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 
sudo chmod a+r /etc/apt/keyrings/docker.asc 

# Add Docker repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list 
sudo apt-get update 

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install SonarQube using Docker
sudo docker pull sonarqube 

# Run PostgreSQL for SonarQube
sudo docker run -d --name sonarqube-db \
  -e POSTGRES_USER=sonar \
  -e POSTGRES_PASSWORD=sonar \
  -e POSTGRES_DB=sonarqube \
  postgres:alpine 

# Run SonarQube
sudo docker run -d --name sonarqube \
  -p 9000:9000 \
  --link sonarqube-db:db \
  -e SONAR_JDBC_URL=jdbc:postgresql://db:5432/sonarqube \
  -e SONAR_JDBC_USERNAME=sonar \
  -e SONAR_JDBC_PASSWORD=sonar \
  sonarqube 


