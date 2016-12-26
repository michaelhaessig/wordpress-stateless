#!/bin/bash
set -e

# Check if a config is provided
if [ -e /var/config/wp-config.php ]; then

  echo "=> Found config using provided wp-config.php... "

  cp /var/config/wp-config.php ./wp-config.php

  # Setup Wordpress Vars
  /vars.sh

  # Handle Search Replace
  [ "$SEARCH_REPLACE" ] && \
    BEFORE_URL=$(echo "$SEARCH_REPLACE" | cut -d ',' -f 1) && \
    AFTER_URL=$(echo "$SEARCH_REPLACE" | cut -d ',' -f 2) || \
    SEARCH_REPLACE=false

  if [ "$SEARCH_REPLACE" != false ]; then
    printf "=> Replacing URLs... "
    REPLACEMENTS=$(wp search-replace "$BEFORE_URL" "$AFTER_URL" --network --skip-columns=guid | grep replacement)
    echo -ne "$REPLACEMENTS\n"
  fi

  # @TODO  MultiSite Domain change : https://wpengine.com/support/how-to-change-a-multi-site-primary-domain/


else

  echo "=> No config provided at /var/config/wp-config.php "
fi

echo "=> Executing command $@"
exec $@
