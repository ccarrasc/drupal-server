#!/bin/bash

sudo apt-get update

# Install Apache HTTP Server
sudo apt-get install apache2 -y

# Install PHP & MySQL
echo mysql-server mysql-server/root_password select "vagrant" | debconf-set-selections
echo mysql-server mysql-server/root_password_again select "vagrant" | debconf-set-selections
sudo apt-get install php5 libapache2-mod-php5 php5-gd mysql-server php5-mysql libssh2-php -y

# Enable mod_rewrite
sudo a2enmod rewrite

# Disable the default site
sudo a2dissite default

# Link and enable the drupal site (config)
sudo ln -s /vagrant/drupal /etc/apache2/sites-available/drupal
sudo a2ensite drupal

# Install Drupal 7.28
cd /var/www
sudo rm -rf *
sudo wget http://ftp.drupal.org/files/projects/drupal-7.28.tar.gz
sudo tar -xzvf drupal-7.28.tar.gz
sudo rm drupal-7.28.tar.gz
sudo mv drupal-7.28/* drupal-7.28/.htaccess drupal-7.28/.gitignore .
sudo rmdir drupal-7.28/
sudo cp sites/default/default.settings.php sites/default/settings.php
sudo chmod a+w sites/default/settings.php
sudo chmod a+w sites/default

# Create a database for Drupal (just using the root user as this is for local dev only)
mysqladmin -u root -pvagrant create drupal-db

# Restart Apache
sudo apachectl restart

echo “Finished.  Browse to http://192.168.100.10/install.php to complete the CMS setup with the following:”
echo “Database name: drupal-db”
echo “Database username: root”
echo “Database password: vagrant”
