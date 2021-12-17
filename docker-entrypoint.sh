#!/bin/bash
set -o nounset -o errexit

mkdir -p /var/lib/glusterd

if [[ "${MGMT_USE_TLS:-false}" != false ]]; then
  touch /var/lib/glusterd/secure-access
else
  rm -f /var/lib/glusterd/secure-access
fi

exec /usr/sbin/glusterd --no-daemon --log-file /dev/stdout --log-level "$LOG_LEVEL" "$@"
