
# Wordpress Stateless CLI

Runs wp-cli for Wordpress maintainance operations.

## Run Container

### Provide all settings via wp-config
> docker run --name wp_stateless --rm  --interactive \
-v /config:/var/config \
wordpress-stateless:cli

## filter wp-config.php with different db connection details for different environments
> docker run --name wp_stateless --rm  --interactive \
-e WORDPRESS_DEV='true' \
-e WORDPRESS_DB_HOST='10.0.0.1:3306' \
-e WORDPRESS_DB_USER='root' \
-e WORDPRESS_DB_PASSWORD='root' \
-e WORDPRESS_DB_NAME='mikiwordpress' \
-v /config:/var/config \
wordpress-stateless:cli
