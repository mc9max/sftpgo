FROM drakkan/sftpgo:latest

# Environment defaults
ENV SFTPGO_HTTPD__BINDINGS__0__PORT=8080 \
    SFTPGO_HTTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_SFTPD__BINDINGS__0__PORT=2022 \
    SFTPGO_SFTPD__BINDINGS__0__ADDRESS=0.0.0.0

# Web UI + SFTP ports
EXPOSE 8080 2022

# Volume for persistent data (users, config, keys, sqlite db)
# Run as root so Railway's root-owned volume mount is writable
USER root
VOLUME /var/lib/sftpgo
WORKDIR /var/lib/sftpgo
CMD ["sftpgo", "serve"]
