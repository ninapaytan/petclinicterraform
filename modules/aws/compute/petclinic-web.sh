#!/bin/bash

#Installing Git
sudo su
yum install git -y

#Installing java
yum install -y java-1.8.0-openjdk && yum install -y java-devel

#Cloning the repo
cd ~
git clone https://github.com/spring-projects/spring-petclinic.git

#Building app
cd spring-petclinic
./mvnw package

#Deploying app
java -jar target/*.jar