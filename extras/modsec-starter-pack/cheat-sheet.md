# ModSecurity Starter Pack Cheat Sheet

## Default Mode
- **DetectionOnly** by default: logs attacks but does NOT block
- Safe for first-time users and low-end servers

## Enable Enforcement (Blocking)
1. Edit `/etc/modsecurity/modsecurity.conf`
2. Change `SecRuleEngine DetectionOnly` → `SecRuleEngine On`
3. Test carefully on WordPress, Drupal, Ghost sites

## Disable ModSecurity
- Set `ENABLE_MODSEC=false` in ci.yml/docker build args
- Or comment out `--add-module=../ModSecurity-nginx` in ci.yml

## Logs
- ModSecurity logs: `/var/log/modsec_audit.log`
- Debug logs: `/var/log/modsec_debug.log`
- Review logs before switching to enforcement mode

## Rules Included
- OWASP Core Rule Set (minimal)
- WordPress starter rules
- Drupal starter rules
- Ghost CMS starter rules

## Notes
- Designed to be safe for a starter pack
- Low-end systems: can disable ModSecurity to save CPU
- Users can extend rules or switch to enforcement when ready
