# NGINX-PARTY Extras 🐳⚡

Welcome to the `extras/` folder! These files are optional helpers, config templates, and test scripts to get the **most out of NGINX-PARTY** with media-rich features, QUIC/HTTP3, Brotli/Zstd, AVIF/WebP, livestreaming, and optional WAF + bot-blocking.

---

## Folder Contents

| File | Description |
|------|-------------|
| `nginx.conf.template` | Example NGINX config optimized for QUIC/HTTP3 + Brotli/Zstd + AVIF/WebP + mobile + IPv6 |
| `waf.rules` | Starter Web Application Firewall (ModSecurity/OWASP) snippet |
| `modsec-exclusions/` | CMS exclusions for WordPress & Drupal to prevent breaking core functionality |
| `badbot/` | Maintained bot-block rules (MitchellKrogza) |
| `brotli-avif-webp-test.sh` | Quick shell script to test Brotli/Zstd compression & AVIF/WebP support |
| `livestream.conf` | Sample config for HLS/RTMP livestream testing |
| `README.md` | This file — guides contributors through testing and experimenting |

---

## 🔹 Quick Start

### 1️⃣ Using `nginx.conf.template`

1. Copy the template to your NGINX config directory:

~~~~bash
cp extras/nginx.conf.template /etc/nginx/nginx.conf
~~~~

2. Adjust paths for SSL certificates (`ssl_certificate`, `ssl_certificate_key`) if needed.  
3. Test configuration:

~~~~bash
nginx -t
~~~~

4. Reload NGINX:

~~~~bash
sudo systemctl reload nginx
~~~~

✅ Now QUIC/HTTP3 + Brotli/Zstd + AVIF/WebP + mobile optimizations + IPv6 headers should be active.

---

### 2️⃣ Testing Compression & Media Formats

Run the provided test script:

~~~~bash
chmod +x extras/brotli-avif-webp-test.sh
./extras/brotli-avif-webp-test.sh
~~~~

Checks:

- Brotli & Zstd compression headers  
- AVIF & WebP image delivery  
- Fun emoji feedback for success or bugs 💥🐛  

---

### 3️⃣ WAF & Security

`extras/waf.rules` contains **starter ModSecurity v3 rules**:

~~~~nginx
# Block SQLi attempts
SecRule REQUEST_URI "@rx select.*from" "id:1001,deny,log,msg:'SQL Injection Attempt'"
# Block XSS
SecRule REQUEST_URI "@rx <script" "id:1002,deny,log,msg:'XSS Attempt'"
~~~~

- Use as a **starter template** only  
- Adjust rules, IDs, and thresholds to your environment  
- Optional: toggle ModSecurity in CI / build with `ENABLE_MODSEC=true`  

#### CMS Exclusions

- `modsec-exclusions/wordpress-before.conf` → prevents breaking WordPress core  
- `modsec-exclusions/drupal-before.conf` → prevents breaking Drupal core  

> ⚡ Recommended for safe default CMS deployments

---

### 4️⃣ Bot-Blocking (Lite Default)

- Includes MitchellKrogza bad-bot rules in `badbot/`  
- Safe default: blocks known scrapers and bad bots  
- Can be overridden / extended by users  

---

### 5️⃣ Livestream Example

`extras/livestream.conf` provides a starting point for HLS/RTMP testing:

~~~~nginx
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
~~~~

- Push streams to `rtmp://your-server/live/stream-key`  
- Adjust `chunk_size` and bandwidth limits for your environment  

---

### 6️⃣ Optional Security & Performance Tools

- Toggle ModSecurity (`ENABLE_MODSEC=true`) in `.github/workflows/ci.yml`  
- Add extra bad-bot rules in `extras/badbot/`  
- Enable PCI/POS hardening if needed (advanced users)  
- IPv6 + mobile optimizations enabled by default  
- Cloudflare headers / real IP awareness baked in  

---

### 7️⃣ Contributing & Experimenting

- Fork the repo and experiment with `extras/` safely  
- Update `nginx.conf.template`, WAF rules, or bot lists as needed  
- Test Docker builds with your configs (`docker.yml`)  
- Use emojis 💥🐛🎉⚡ in scripts for fun feedback  

---

### 8️⃣ Notes & Tips

- Keep `.deb` artifact & Docker builds in sync  
- Always validate configs with `nginx -t` before reload  
- Use `extras/brotli-avif-webp-test.sh` to verify HTTP headers & image formats  
- Livestreaming configs are experimental — tune for your server  
- CI builds emit **bug trap emojis 💥🐛** if something fails — check logs  

---

### 🎉 Have fun experimenting!

NGINX-PARTY is designed to be **media-rich, secure by default, and blazing fast**. Explore QUIC/HTTP3, Brotli/Zstd, AVIF/WebP, livestreaming, and optional WAF + bot-blocking safely with the `extras/` folder.

Fork, test, push Docker images, and enjoy the emojis! 🚀
