#!/bin/sh
set -e

# Fix volume permissions for Railway (root-owned mount, uid 1000 process)
if [ -d "/var/lib/sftpgo" ]; then
    chown -R 1000:1000 /var/lib/sftpgo || true
    chmod -R 755 /var/lib/sftpgo || true
fi

# Switch to uid 1000 and exec sftpgo
exec su -s /bin/sh -c 'exec "$@"' sftpgo -- sftpgo serve
