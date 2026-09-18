#!/bin/sh
set -e

# Railway volumes are root-owned; drakkan runs as uid 1000.
# cd to /tmp so host keys and db are written to a writable dir.
cd /tmp

exec sftpgo serve
