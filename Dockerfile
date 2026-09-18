FROM drakkan/sftpgo:latest

ENV SFTPGO_HTTPD__BINDINGS__0__PORT=8080 \
    SFTPGO_HTTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_HTTPD__TOKEN_VALIDATION=1 \
    SFTPGO_SFTPD__BINDINGS__0__PORT=2022 \
    SFTPGO_SFTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_DATA_PROVIDER__DRIVER=sqlite \
    SFTPGO_DATA_PROVIDER__NAME=/var/lib/sftpgo/sftpgo.db

USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080 2022

WORKDIR /var/lib/sftpgo
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sftpgo", "serve"]
