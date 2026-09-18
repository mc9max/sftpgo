#!/bin/sh
set -e

# Railway volumes are root-owned; drakkan runs as uid 1000.
# cd to /app so host keys and db are written to a writable dir.
cd /app

exec sftpgo serve
