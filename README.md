# NGINX-PARTY 🚀🎉

**Build Status:** ![GitHub Workflow Status](https://github.com/<owner>/NGINX-PARTY/actions/workflows/ci.yml/badge.svg)

## Overview

NGINX-PARTY is a **fun, media-rich NGINX build** with:

- QUIC / HTTP3 ⚡
- Brotli compression 🌟
- AVIF/WebP support 🖼️
- Docker images 🐳
- Auto `.deb` packaging 📦
- GitHub Release automation 🎉
- Bug trap emojis 🐛💥 for failed builds
- currently in testing. 

---

## Quick Start

### Secrets Required

Set the following in your fork or repository settings:

- `DOCKER_USERNAME` → Docker Hub username
- `DOCKER_PASSWORD` → Docker Hub password or PAT
- `GHCR_TOKEN` → GitHub PAT with `write:packages` (optional for private GHCR)
- `GITHUB_TOKEN` → auto-provided

---

### Pull Docker Images

```bash
docker pull $DOCKER_USERNAME/nginx-party:latest
docker pull ghcr.io/<your-org>/nginx-party:latest


