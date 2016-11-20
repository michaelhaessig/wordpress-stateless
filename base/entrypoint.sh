#!/bin/bash
set -e

# Setup Wordpress Vars
/vars.sh

# Change Group of Themes Folder if mapped to local folder for dev
sudo chgrp -R www-data /var/www/html/wp-content/themes/

# Execute PHP-FPM
echo "=> Executing PHP FPM"
exec php-fpm
