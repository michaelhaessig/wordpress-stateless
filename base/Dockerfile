FROM php:7.1-fpm

# install the PHP extensions we need
RUN apt-get update && apt-get install -y sudo wget unzip vim mysql-client libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mysqli opcache


# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# wordpress version from : https://github.com/docker-library/wordpress/blob/master/php7.0/fpm/Dockerfile
ENV WORDPRESS_VERSION 4.7.5
ENV WORDPRESS_SHA1 fbe0ee1d9010265be200fe50b86f341587187302

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& tar -xzf wordpress.tar.gz -C /usr/src/ \
	&& rm wordpress.tar.gz \
	&& chown -R www-data:www-data /usr/src/wordpress


##############################################################################################
# WORDPRESS CUSTOM SETUP
##############################################################################################

# extract wordpress on build
RUN tar cf - --one-file-system -C /usr/src/wordpress . | tar xf -

# add custom scripts
ADD vars.sh /vars.sh
ADD entrypoint.sh /entrypoint.sh
ADD plugins.sh /plugins.sh
RUN chmod +x /entrypoint.sh /vars.sh /plugins.sh


# execute custom entrypoint script
CMD ["/entrypoint.sh"]
