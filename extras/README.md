# NGINX-PARTY Extras 🐳⚡

Welcome to the `extras/` folder! These files are optional helpers, config templates, and test scripts to get the **most out of NGINX-PARTY** with media-rich features, QUIC/HTTP3, Brotli, AVIF/WebP support, and even livestreaming.

---

## Folder Contents

| File | Description |
|------|-------------|
| `nginx.conf.template` | Example NGINX config optimized for QUIC/HTTP3 + Brotli + new media formats |
| `waf.rules` | Starter Web Application Firewall (WAF) rules snippet |
| `brotli-avif-webp-test.sh` | Quick shell script to test Brotli compression & AVIF/WebP image support |
| `livestream.conf` | Sample config for HLS/RTMP livestream testing |
| `README.md` | This file — guides contributors through testing and experimenting |

---

## 🔹 Quick Start

### 1️⃣ Using `nginx.conf.template`

1. Copy the template to your NGINX config directory:
```bash
cp extras/nginx.conf.template /etc/nginx/nginx.conf
```
2. Adjust paths for SSL certificates (`ssl_certificate`, `ssl_certificate_key`) if needed.  
3. Test config:
```bash
nginx -t
```
4. Reload NGINX:
```bash
sudo systemctl reload nginx
```
✅ Now QUIC/HTTP3 + Brotli + AVIF/WebP headers should be active.

---

### 2️⃣ Testing Compression & Media Formats

Run the provided test script:
```bash
chmod +x extras/brotli-avif-webp-test.sh
./extras/brotli-avif-webp-test.sh
```

What it does:

- Checks Brotli compression headers  
- Checks if server serves AVIF & WebP images correctly  
- Prints fun emojis for success or bug traps for issues 💥🐛  

---

### 3️⃣ WAF Rules Snippet

`extras/waf.rules` contains example rules to protect NGINX from common attacks:

```nginx
# Block SQLi attempts
SecRule REQUEST_URI "@rx select.*from" "id:1001,deny,log,msg:'SQL Injection Attempt'"
# Block XSS
SecRule REQUEST_URI "@rx <script" "id:1002,deny,log,msg:'XSS Attempt'"
```

> 📝 Note: Adjust IDs and rules to your environment. Use as a **starter template** only.

---

### 4️⃣ Livestream Example

`extras/livestream.conf` gives a starting point for HLS/RTMP testing:

```nginx
rtmp {
    server {
        listen 1935;
        chunk_size 4096;

        application live {
            live on;
            record off;
        }
    }
}
```

After setup, you can push streams to `rtmp://your-server/live/stream-key` and test playback.

---

### 5️⃣ Contributing & Experimenting

- Fork the repo and experiment with `extras/` safely.  
- If adding new media formats, update `nginx.conf.template` & test scripts.  
- Use emojis 💥🐛🎉⚡ in your scripts to highlight errors and successes — contributors love fun feedback!  
- Test Docker builds with your modified configs in the `docker.yml` workflow.

---

### 6️⃣ Notes & Tips

- Keep your `.deb` artifact & Docker builds in sync.  
- Always test config with `nginx -t` before reloading.  
- Use `extras/brotli-avif-webp-test.sh` as a quick validation for HTTP headers & image formats.  
- Livestreaming configs are experimental — adjust `chunk_size` and bandwidth limits based on your server.  
- Any bugs during CI will appear with fun **bug trap emojis 💥🐛** — check logs for details.

---

### 🎉 Have fun experimenting!

NGINX-PARTY is meant to be **media-rich, blazing fast, and experimental**. The `extras/` folder helps you explore QUIC/HTTP3, Brotli, AVIF/WebP, and even livestreaming without touching your main workflow.

Fork, test, push Docker images, and enjoy the emojis! 🚀
