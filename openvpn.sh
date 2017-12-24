#!/bin/sh
set -e -u -o pipefail


if [ -n "$CONFIG" ]; then
  set -- "$@" '--config' "${CONFIG}"
fi

if [ ! -f /pia/auth.conf ]; then 
  echo "[FATAL] Auth file not mounted to /pia/auth.conf"
fi
set -- "$@" '--auth-user-pass' 'auth.conf'
openvpn "$@"
