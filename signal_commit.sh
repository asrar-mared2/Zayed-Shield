#!/bin/bash
MSG="$1"
[ -z "$MSG" ] && echo "يرجى تمرير رسالة commit." && exit 1
echo "$(date '+%Y-%m-%d %H:%M:%S') | $MSG" >> .security_signals.log
git add .security_signals.log
git commit -m "security: $MSG"
git push origin security-signals
