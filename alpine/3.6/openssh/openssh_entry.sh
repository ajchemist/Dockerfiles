#!/usr/bin/env bash

DAEMON=sshd

# Fix permissions, if writable
if [ -w ~/.ssh ]; then
    chown root:root ~/.ssh && chmod 700 ~/.ssh/
fi

if [ -w ~/.ssh/authorized_keys ]; then
    chown root:root ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
fi

# Warn if no config
if [ ! -e ~/.ssh/authorized_keys ]; then
  echo "WARNING: No SSH authorized_keys found for root"
fi

stop() {
    echo "Received SIGINT or SIGTERM. Shutting down $DAEMON"
    pid=$(cat /var/run/$DAEMON/$DAEMON.pid)
    kill -SIGTERM "${pid}"
    wait "${pid}"
    echo Done.
}

echo sshd started...
trap stop SIGINT SIGTERM
/usr/sbin/sshd -D -f /etc/ssh/sshd_config &
pid="$!"
mkdir -p /var/run/$DAEMON
echo "${pid}" > /var/run/$DAEMON/$DAEMON.pid
wait "${pid}" && exit $?

if [ $# -gt 0 ]; then
    exec "$@"
fi
