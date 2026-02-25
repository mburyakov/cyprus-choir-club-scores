#!/bin/bash
set -e

VERSION=${VERSION:-"stable"}

echo "Installing LilyPond (${VERSION})..."

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Ensure apt is available
if ! type apt-get > /dev/null 2>&1; then
    echo "Skipping LilyPond installation: apt-get not found."
    exit 1
fi

apt_get_update
apt-get install -y --no-install-recommends lilypond

echo "LilyPond installed successfully."
lilypond --version
