# NGINX-PARTY 🚀🎉

**Build Status:** ![GitHub Workflow Status](https://github.com/<owner>/NGINX-PARTY/actions/workflows/ci.yml/badge.svg)

---

## Overview

NGINX-PARTY is a **fun, media-rich, kitchen-sink NGINX build** designed for:

- QUIC / HTTP3 ⚡
- Brotli / Zstd compression 🌟
- AVIF/WebP support 🖼️
- Docker images 🐳
- Auto `.deb` packaging 📦
- GitHub Release automation 🎉
- Optional ModSecurity v3 WAF 🛡️
- Bot-blocking lists 🚫
- IPv6 + Cloudflare-aware 🌐
- Mobile speed optimizations 📱
- Safe default CMS rules (WordPress / Drupal)  
- Bug trap emojis 🐛💥 for failed builds

---

## Quick Start

### Secrets Required

Set the following in your fork or repository settings:

- `DOCKER_USERNAME` → Docker Hub username  
- `DOCKER_PASSWORD` → Docker Hub password or PAT  
- `GHCR_TOKEN` → GitHub PAT with `write:packages` (optional for private GHCR)  
- `GITHUB_TOKEN` → auto-provided by GitHub Actions

---

### Build via GitHub Actions

1. Clone the repo:

~~~~bash
git clone https://github.com/frankpanduh/NGINX-PARTY.git
cd NGINX-PARTY
~~~~

2. Push changes → CI builds `.deb`  

3. Optionally toggle ModSecurity in `.github/workflows/ci.yml`:

~~~~yaml
env:
  ENABLE_MODSEC: "true"
~~~~

---

### Pull Docker Images

~~~~bash
docker pull $DOCKER_USERNAME/nginx-party:latest
docker pull ghcr.io/<your-org>/nginx-party:latest
~~~~

---

## CI / Build Features

- Builds latest NGINX (or pinned version via `NGINX_VERSION`)  
- OpenSSL from source for strong TLS  
- Brotli, Zstd, GeoIP2, Cache-Purge, FancyIndex modules  
- Optional ModSecurity v3 WAF  
- AVIF/WebP caching & MIME  
- Bot-block (lite default) from MitchellKrogza  
- IPv6 + Cloudflare real IP awareness  
- Mobile speed baked in  

---

### Docker Build

Use `.github/workflows/docker.yml`:

- Builds `nginx-party:latest` image  
- Tags for Docker Hub and GHCR  
- Pushes automatically if secrets are configured  

Example commands:

~~~~bash
docker build -t nginx-party:latest .
docker tag nginx-party:latest $DOCKER_USERNAME/nginx-party:latest
docker push $DOCKER_USERNAME/nginx-party:latest
~~~~

---

### GitHub Release

Use `.github/workflows/release.yml`:

- Downloads `.deb` from CI artifact  
- Creates GitHub release with tag `v*`  
- Attaches `.deb` artifact  
- Notes auto-populated with modules & extras info  

---

### NGINX Config Highlights

Safe default config includes:

- Cloudflare real IP
- IPv6 resolver
- Brotli / gzip / zstd
- ModSecurity WAF (optional)
- Bot-block-lite
- CMS exclusions (WordPress/Drupal)

~~~~nginx
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 10240;
    multi_accept on;
    use epoll;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    resolver 1.1.1.1 [2606:4700:4700::1111] valid=300s ipv6=on;

    set_real_ip_from 0.0.0.0/0;
    real_ip_header CF-Connecting-IP;

    gzip on;
    gzip_types text/plain text/css application/json application/javascript;
    brotli on;
    brotli_types text/html text/css application/javascript application/json;

    include badbot/*.conf;

    ModSecurityEnabled on;
    ModSecurityConfig /etc/nginx/modsec/main.conf;

    include modsec-exclusions/wordpress-before.conf;
    include modsec-exclusions/drupal-before.conf;

    include /etc/nginx/conf.d/*.conf;
}
~~~~

---

### Extras / Optional

- Toggle ModSecurity (`ENABLE_MODSEC=true`)  
- Add extra bad-bot rules (`extras/badbot/`)  
- CMS-specific exclusions for advanced setups  
- Performance tuning in `ci.yml` / Dockerfile  
- Optional hardening for PCI / POS environments  

---

### Notes

- Test staging environment first  
- Logs: check `/var/log/nginx/error.log` and access.log  
- CVE awareness: keep NGINX, OpenSSL, modules up to date  
- Safe defaults prevent breaking WordPress / Drupal installs  

---

### Contributing

- Add new modules in `.github/workflows/ci.yml` build step  
- Update bad-bot / CMS exclusions in `extras/`  
- PRs should maintain emoji-friendly, copy-paste-safe style
