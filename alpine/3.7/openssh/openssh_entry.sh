#!/usr/bin/env bash

DAEMON=sshd
DAEMON_PID_FILE="/var/run/$DAEMON/$DAEMON.pid"

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
    echo "Received SIGINT or SIGTERM. Shutting down $DAEMON..."
    pid=$(cat $DAEMON_PID_FILE)
    kill -SIGTERM "${pid}"
    wait "${pid}"
    echo "Done."
}

trap stop SIGINT SIGTERM
/usr/sbin/sshd -D -f /etc/ssh/sshd_config &
pid="$!"
echo sshd started...

mkdir -p /var/run/$DAEMON
echo "${pid}" > $DAEMON_PID_FILE

export $DAEMON_PID_FILE

if [ $# -gt 0 ]; then
    exec "$@"
else
    wait "${pid}" && exit $?
fi
