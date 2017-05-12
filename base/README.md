
# Wordpress Stateless Base

## Build Container
> docker build -t wp-stateless-base:wp-<version> .

## Run Container
> docker run --name wp_stateless --rm \
-e WORDPRESS_DEV='true' \
-e WORDPRESS_DB_HOST='10.0.0.1:3306' \
-e WORDPRESS_DB_USER='root' \
-e WORDPRESS_DB_PASSWORD='root' \
-e WORDPRESS_DB_NAME='wordpress' \
