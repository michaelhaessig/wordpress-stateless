FROM wp-statless-nginx:wp-4.7.2

##############################################################################################
# CUSTOM PHP CONFIG
##############################################################################################
RUN { \
  		echo 'upload_max_filesize=10M'; \
  		echo 'post_max_size=10M'; \
  	} > /usr/local/etc/php/conf.d/upload.ini

##############################################################################################
# WORDPRESS Config
##############################################################################################
ADD ./wordpress/wp-config.php /var/www/html/wp-config.php
# chown wp-config.php to root
RUN chown root:root /var/www/html/wp-config.php

##############################################################################################
# WORDPRESS Plugins Setup
##############################################################################################
RUN mkdir /plugins

# Add All Plugin Files but
ADD ./wordpress/plugins/ /plugins

# Execute each on its own for better caching support
RUN /plugins.sh /plugins/base
RUN /plugins.sh /plugins/security

# Delete Plugins script and folder
RUN rm /plugins.sh && rm /plugins -r

# ADD OWN CUSTOM PLUGINS
ADD ./plugins/my-plugin /var/www/html/wp-content/plugins/my-plugin

##############################################################################################
# WORDPRESS Themes Setup
##############################################################################################
ADD ./themes/my-theme /var/www/html/wp-content/themes/my-theme
