#!/bin/sh
# Render config.php before the web server starts.
#
# Easy!Appointments keeps its database credentials in a PHP file with hardcoded
# constants and never reads the environment, so the values have to be baked in
# here. Docker turns a missing bind source into a directory, which is why the
# target file is also pre-created when absent.
set -eu

TARGET=/target/config.php
TEMPLATE=/template/config.php.tpl

mkdir -p /target

# A stale directory at the bind source would break the mount; clear it.
if [ -d "$TARGET" ]; then
    echo "init: removing stray directory at $TARGET" >&2
    rmdir "$TARGET" 2>/dev/null || true
fi

if [ -s "$TARGET" ]; then
    echo "init: config.php already rendered, keeping it"
    exit 0
fi

sed -e "s|__BASE_URL__|${EA_BASE_URL}|g" \
    -e "s|__DB_HOST__|${EA_DB_HOST}|g" \
    -e "s|__DB_NAME__|${EA_DB_NAME}|g" \
    -e "s|__DB_USERNAME__|${EA_DB_USERNAME}|g" \
    -e "s|__DB_PASSWORD__|${EA_DB_PASSWORD}|g" \
    "$TEMPLATE" > "$TARGET"

chmod 0644 "$TARGET"
echo "init: wrote $TARGET for ${EA_BASE_URL}"
