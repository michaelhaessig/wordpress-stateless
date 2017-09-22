FROM wp-stateless-cli:wp-4.8.2

# install nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*


##############################################################################################
# NGINX SETUP
##############################################################################################
RUN rm -r /etc/nginx/sites-enabled/*
ADD default.conf /etc/nginx/sites-enabled/default.conf
ADD wordpress.conf /etc/nginx/global/wordpress.conf
ADD restrictions.conf /etc/nginx/global/restrictions.conf


##############################################################################################
# CUSTOM ENTRYPOINT
##############################################################################################
ADD entrypoint.sh /entrypoint_nginx.sh
RUN chmod +x /entrypoint_nginx.sh

# reset entrypoint from parent cli
ENTRYPOINT []
CMD ["/entrypoint_nginx.sh"]
