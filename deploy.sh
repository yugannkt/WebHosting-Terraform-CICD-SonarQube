#!/bin/bash
sudo systemctl start apache2
sudo rm -rf /var/www/html/*
sudo cp -r * /var/www/html/
sudo chown -R www-data:www-data /var/www/html/*
sudo chmod -R 755 /var/www/html/*
sudo systemctl restart apache2
