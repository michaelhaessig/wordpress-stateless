
# Wordpress Stateless

Dockerfiles for a custom Wordpress Setup that is fully Stateless.

## base

Contains the Wordpress installation and some additional scripts for plugins setup and variable config filtering.
Includes PHP-FPM.

## cli

Adds WP-CLI to the Dockerfile to use for maintainance operations on the Wordpress installation Database.

## nginx

Installs NGINX and adds configuration to call PHP-FPM.

## setup

Setup Script for a fresh wordpress setup via the WP-CLI docker container.
