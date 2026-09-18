FROM drakkan/sftpgo:latest

# Environment defaults
ENV SFTPGO_HTTPD__BINDINGS__0__PORT=8080 \
    SFTPGO_HTTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_SFTPD__BINDINGS__0__PORT=2022 \
    SFTPGO_SFTPD__BINDINGS__0__ADDRESS=0.0.0.0

# Web UI + SFTP ports
EXPOSE 8080 2022

# Create data dir and run as root so Railway's root-owned volume mount is writable
USER root
RUN mkdir -p /var/lib/sftpgo && chown root:root /var/lib/sftpgo
WORKDIR /var/lib/sftpgo
CMD ["sftpgo", "serve"]