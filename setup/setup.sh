#!/bin/bash
set -e

##############################################################################################
# SETUP WP-CONFIG
##############################################################################################

# Parse needed vars from wp-cli.yml config to avoid duplication
WORDPRESS_DB_HOST=$(grep "dbhost" wp-cli.yml | cut -d ' ' -f 4)
WORDPRESS_DB_NAME=$(grep "dbname" wp-cli.yml | cut -d ' ' -f 4)
WORDPRESS_DB_PASSWORD=$(grep "dbpass" wp-cli.yml | cut -d ' ' -f 4)

echo "=> Connecting to Database $WORDPRESS_DB_HOST .."

# Check if no config is provided
if [ ! -e /var/config/wp-config.php ]; then

  # Wait for MySQL
  echo "=> Waiting for Database to initialize... "
  while ! mysqladmin ping --host=$(echo "$WORDPRESS_DB_HOST" | cut -d ':' -f 1) --port=$(echo "$WORDPRESS_DB_HOST" | cut -d ':' -f 2) --password=$WORDPRESS_DB_PASSWORD --silent; do
    sleep 1
  done


    echo "=> Generating wp-config.php file..."
    #sudo -u www-data wp core config
    wp core config

    echo "=> Adding reverse proxy config to wp-config.php file... "
    cat <<'EOPHP' >> /tmp/proxy.txt
    // If we're behind a proxy server and using HTTPS, we need to alert Wordpress of that fact
    // see also http://codex.wordpress.org/Administration_Over_SSL#Using_a_Reverse_Proxy
    if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
    }
EOPHP

    sed -i '/stop editing/ r /tmp/proxy.txt' wp-config.php && rm /tmp/proxy.txt
    echo "Done!"

##############################################################################################
# SETUP WORDPRESS DATABASE
##############################################################################################
  echo "=> Checking database $WORDPRESS_DB_NAME... "
  if [ ! "$(wp core is-installed --allow-root >/dev/null 2>&1 && echo $?)" ]; then
    #sudo -u www-data wp db create
     wp db create
    echo "Done!"

    echo "=> Initializing new multisite database... "
      #sudo -u www-data wp core multisite-install
      wp core multisite-install
      echo "Done!"
  else
    echo "=> !! Wordpress already installed !!"
  fi

  cp wp-config.php /var/config/wp-config.php
  echo "=> Copied wp-config.php into volume at /var/config/"


else

  echo "=> Found /var/config/wp-config.php doing nothing"
fi
