#! /bin/bash

#Installing lamp-server
echo 'mysql-server mysql-server/root_password password p@ssw0rd' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password p@ssw0rd' | sudo debconf-set-selections
sudo apt-get -y install lamp-server^

#Uninstalling PHP7.0
sudo apt-get remove -y --purge php7.0*

#Installing PHP5.6
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install -y php5.6

#Installing PHP5.6 modules
sudo apt-get install libapache2-mod-php5.6 php5.6-cgi php5.6-curl php5.6-imap php5.6-gd php5.6-mysql php5.6-pgsql php5.6-sqlite3 php5.6-mbstring php5.6-json php5.6-bz2 php5.6-mcrypt php5.6-gmp php5.6-xsl php5.6-soap php5.6-zip php5.6-dba -y

#PHP7.0 to PHP5.6 modules
sudo a2dismod php7.0
sudo a2enmod php5.6
sudo service apache2 restart

#Downloading DVWA
sudo apt-get install git -y
cd /var/www/html
sudo git clone https://github.com/ethicalhack3r/DVWA.git
sudo chmod -R 777 /var/www/html/DVWA/

#Configuring DVWA
mv /var/www/html/DVWA/config/config.inc.php.dist /var/www/html/DVWA/config/config.inc.php
cd /var/www/html/DVWA
sudo chgrp www-data hackable/uploads
sudo chgrp www-data external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
sudo chgrp www-config
sudo chmod g+w hackable/uploads
sudo chmod g+w external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
sudo chmod g+w config

#Configuring php.inc
sudo sed 's/^\(allow_url_include\).*/\1 = On/' -i /etc/php/5.6/apache2/php.ini
sudo service apache2 restart
sudo sed -i "/recaptcha_public_key/c\$_DVWA[ 'recaptcha_public_key' ] = '6LdH_YAUAAAAAC6ytD3oz9IjwLZddZMpXHjoVNt3';" /var/www/html/DVWA/config/config.inc.php
sudo sed -i "/recaptcha_private_key/c\$_DVWA[ 'recaptcha_private_key' ] = '6LdHYAUAAAAAJWt-6mP6rwNGSwckRYxD7-d29vy';" /var/www/html/DVWA/config/config.inc.php

#Creating mysql database
#mysql -u root -pp@ssw0rd

