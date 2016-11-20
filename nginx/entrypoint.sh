#!/bin/bash
set -e

echo "=> Starting NGINX.. "
# start nginx daemonless in background
nginx -g "daemon off;" &

# execute base entrypoint and pass params
/entrypoint.sh $@
