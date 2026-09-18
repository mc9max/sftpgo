#!/bin/sh
set -e

# Railway volumes mount root-owned; drakkan runs as uid 1000.
# chmod 777 the volume so sftpgo can write host keys and data.
chmod 777 /var/lib/sftpgo 2>/dev/null || true

# Drop from root to uid 1000 before executing sftpgo
exec su -s /bin/sh -c 'exec "$@"' sftpgo -- sftpgo serve
