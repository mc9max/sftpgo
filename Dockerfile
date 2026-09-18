FROM drakkan/sftpgo:latest

ENV SFTPGO_HTTPD__BINDINGS__0__PORT=8080 \
    SFTPGO_HTTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_SFTPD__BINDINGS__0__PORT=2022 \
    SFTPGO_SFTPD__BINDINGS__0__ADDRESS=0.0.0.0 \
    SFTPGO_DATA_PROVIDER__DRIVER=sqlite \
    SFTPGO_DATA_PROVIDER__NAME=/app/sftpgo.db

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080 2022

USER root
WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sftpgo", "serve"]
