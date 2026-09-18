#!/bin/sh
set -e

# Railway volumes mount root-owned; drakkan runs as uid 1000.
# chmod 777 the volume so sftpgo can write host keys and data.
chmod 777 /var/lib/sftpgo 2>/dev/null || true

exec sftpgo serve
