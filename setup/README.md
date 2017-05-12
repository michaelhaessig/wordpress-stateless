
# Wordpress Stateless Setup

Used to initialize a fresh Database and generate a wp-config.php file.

- Adjust settings in wp-cli.yml
- Run Container with mapped output folder to save wp-config.php
- Execute setup.sh via the CMD parameter

> docker run --name wp_stateless_setup --rm  --interactive \
-v $(pwd)/output:/var/config \
-v $(pwd)/wp-cli.yml:/var/www/html/wp-cli.yml \
-v $(pwd)/setup.sh:/var/www/html/setup.sh \
wp-stateless-cli:wp-4.7.2 /var/www/html/setup.sh
