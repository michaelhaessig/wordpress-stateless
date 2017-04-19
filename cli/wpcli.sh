#!/bin/bash
set -e

# wrap wpcli command
sudo -u www-data wpcli "$@"
