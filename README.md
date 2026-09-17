# SFTPGo — Secure File Transfer Server

Deploy a production-ready SFTP server with web UI on Railway.

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.com/deploy/sftpgo)

## Features

- **SFTP** — Secure file transfer over SSH (port 2022)
- **HTTP/S** — Web-based file access and management
- **FTP/S** — Legacy FTP support with TLS
- **WebDAV** — WebDAV file sharing protocol
- **WebAdmin UI** — Browser-based admin panel
- **WebClient** — Browser-based file browser
- **Storage Backends** — Local filesystem, S3, GCS, Azure Blob, other SFTP servers
- **Authentication** — Users, groups, SSH keys, API keys, OAuth2
- **SQLite-backed** — Single-instance database with persistent storage

## Quick Start

1. Click **Deploy on Railway** above
2. Configure admin credentials (auto-generated on first run if not set)
3. Once deployed, visit your public domain to access the Web UI
4. Create your first admin account and user

**Default admin setup**: On first visit, SFTPGo redirects to `/web/admin/setup` where you create your admin account.

## Ports

| Port | Service | Description |
|------|---------|-------------|
| 8080 | HTTP/S | Web UI, WebClient, REST API (mapped to public domain) |
| 2022 | SFTP | SFTP file transfer service |

## Configuration

All configuration is via environment variables. SFTPGo converts env vars to config by prefixing with `SFTPGO_` and using `__` for nested keys. For example:

- `SFTPGO_HTTPD__BINDINGS__0__PORT` → `httpd.bindings[0].port`
- `SFTPGO_SFTPD__BINDINGS__0__PORT` → `sftpd.bindings[0].port`

## Dependencies

- **Storage**: A Railway volume mounted at `/var/lib/sftpgo` for the SQLite database and config persistence
- **No external services required** — runs as a single container with embedded SQLite

## Documentation

- [SFTPGo Documentation](https://docs.sftpgo.com/)
- [Configuration Reference](https://docs.sftpgo.com/enterprise/config-file/)
- [Docker Deployment Guide](https://docs.sftpgo.com/enterprise/docker/)
- [GitHub Repository](https://github.com/drakkan/sftpgo)

## License

SFTPGo Community Edition is licensed under AGPL-3.0.
