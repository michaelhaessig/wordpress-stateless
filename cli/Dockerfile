FROM wp-stateless-base:wp-4.9

##############################################################################################
# WORDPRESS CLI SETUP
##############################################################################################

# install less for wp-cli support , and xterm for terminal support
RUN apt-get update && apt-get install -y less
ENV TERM=xterm

# install wp-cli
RUN curl -o /usr/local/bin/wpcli https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x /usr/local/bin/wpcli

# add wpcli wrapper
ADD wpcli.sh /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

# add tab completion
ADD wp-completion.bash /wp-completion.bash
RUN echo "source /wp-completion.bash" >> ~/.bashrc

##############################################################################################
# CUSTOM ENTRYPOINT
##############################################################################################
ADD entrypoint.sh /entrypoint_cli.sh
RUN chmod +x /entrypoint_cli.sh

ENTRYPOINT ["/entrypoint_cli.sh"]
