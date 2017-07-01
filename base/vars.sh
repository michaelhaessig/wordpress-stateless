#!/bin/bash
set -e

##############################################################################################
# WORDPRESS DYNAMIC VARS
##############################################################################################

if [ "$WORDPRESS_DB_NAME" ]; then
  sed "/DB_NAME/s/'[^']*'/'$WORDPRESS_DB_NAME'/2" -i wp-config.php
fi

if [ "$WORDPRESS_DB_USER" ]; then
  sed "/DB_USER/s/'[^']*'/'$WORDPRESS_DB_USER'/2" -i wp-config.php
fi

if [ "$WORDPRESS_DB_PASSWORD" ]; then
  sed "/DB_PASSWORD/s/'[^']*'/'$WORDPRESS_DB_PASSWORD'/2" -i wp-config.php
fi

if [ "$WORDPRESS_DB_HOST" ]; then
  sed "/DB_HOST/s/'[^']*'/'$WORDPRESS_DB_HOST'/2" -i wp-config.php
fi

if [ "$WORDPRESS_CURRENT_HOST" ]; then
  sed "/DOMAIN_CURRENT_SITE/s/'[^']*'/'$WORDPRESS_CURRENT_HOST'/2" -i wp-config.php
fi

# DEV TRUE FALSE SED REPLACES DIFFERENT THAN STRING FORM ABOVE
if [ "$WORDPRESS_DEV" == "true" ]; then
  printf "=> Disabling PHP OPCACHE \n"
  # php fpm cache gets triggered by opcache.enable_cli=1
  rm /usr/local/etc/php/conf.d/opcache-recommended.ini || true

  sed "/'WP_DEBUG'/s/false/true/g" -i wp-config.php
  sed "/'WP_DEBUG_LOG'/s/false/true/g" -i wp-config.php
  # show debug/error output
  sed "/'WP_DEBUG_DISPLAY'/s/true/false/g" -i wp-config.php
else
  sed "/'WP_DEBUG'/s/false/true/g" -i wp-config.php
  sed "/'WP_DEBUG_LOG'/s/false/true/g" -i wp-config.php
  # just disable debug/error output
  sed "/'WP_DEBUG_DISPLAY'/s/true/false/g" -i wp-config.php
fi
