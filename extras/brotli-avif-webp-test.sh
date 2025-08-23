#!/bin/bash
# NGINX-PARTY: Test Brotli + AVIF + WebP Headers

echo "⚡ Testing Brotli Compression..."
curl -H "Accept-Encoding: br" -I http://localhost:8080

echo "🖼️ Testing AVIF Support..."
curl -H "Accept: image/avif" -I http://localhost:8080

echo "🖼️ Testing WebP Support..."
curl -H "Accept: image/webp" -I http://localhost:8080

echo "🎉 All tests complete!"
