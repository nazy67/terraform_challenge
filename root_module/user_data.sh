#!/bin/bash
sudo yum install httpd -y
sudo echo “Hello world!!!” >> /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd