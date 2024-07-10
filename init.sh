#!/usr/bin/env bash

# This script will be run as root and it's used to adjusts permissions to files.
# It then runs git-local-sync as the app user.

chown app:app /repo
if [ -f /key ]; then
    chown app:app /key
fi

sudo -E -H -u app git-local-sync "$@"
