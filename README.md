# SFTPGo — Secure File Transfer Server

Deploy SFTPGo, a secure file transfer server with web UI, SFTP, FTP/S, and WebDAV support, on Railway.

## Deploy and Host

Host your own SFTPGo instance on Railway. This template provisions the SFTPGo server with persistent storage for user accounts, SSH keys, and SQLite configuration.

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.com/deploy/melodious-perception)

## Why Deploy

SFTPGo is the open-source SFTP server powering secure file transfer for teams, DevOps pipelines, and self-hosted apps. Running it on Railway gives you a production-ready, auto-updating, globally reachable instance with:

- **Multi-protocol** — SFTP, FTP/S, WebDAV, and HTTP/S from a single service
- **Web UI** — browser-based admin panel and file browser
- **Persistent storage** — user accounts, keys, and config survive restarts on a Railway volume
- **Single container** — no external dependencies, fast startup
- **SQLite-backed** — embedded database, zero config
- **Auth flexibility** — users, groups, SSH keys, API keys, OAuth2
- **Production-ready** — used for secure file transfer in regulated industries

## Common Use Cases

- **Secure file transfer** — SFTP-based uploads and downloads for applications
- **DevOps pipelines** — artifact storage and CI/CD file distribution
- **Self-hosted cloud storage** — WebDAV/WebClient for personal file access
- **FTP replacement** — modernize legacy FTP with TLS
- **API access** — REST API for programmatic file management
- **Multi-user hosting** — per-user SFTP accounts for teams

### Deployment Dependencies

The deploy form pre-fills all required variables. No additional services needed — SFTPGo runs as a single container with a volume for persistent storage.

**After the first successful deploy:**

1. Open `https://<your-domain>/web/admin/setup` to create your admin account
2. The setup page only appears once on first run
3. Create users and start transferring files

## About Hosting

SFTPGo runs as a single container on Railway with a volume mount at `/var/lib/sftpgo`. All configuration, user data, and the SQLite database persist across restarts.

### Default Ports

| Port | Service | Description |
|------|---------|-------------|
| 8080 | HTTP/S | Web UI, WebClient, REST API (mapped to public domain) |
| 2022 | SFTP | SFTP file transfer service |

## Dependencies for

This template deploys a single SFTPGo container with a Railway volume for persistent storage. No additional services are required.

## Configuration

All configuration is via environment variables. SFTPGo converts env vars to config by prefixing with `SFTPGO_` and using `__` for nested keys. For example:

- `SFTPGO_HTTPD__BINDINGS__0__PORT` → `httpd.bindings[0].port`
- `SFTPGO_SFTPD__BINDINGS__0__PORT` → `sftpd.bindings[0].port`

For the full list of environment variables, see the [SFTPGo documentation](https://docs.sftpgo.com/enterprise/env-vars/).

## Documentation

- [SFTPGo Docs](https://docs.sftpgo.com/)
- [SFTPGo GitHub](https://github.com/drakkan/sftpgo)