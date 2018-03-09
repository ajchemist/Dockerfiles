#!/bin/sh

# TMPDIR=${TMPDIR:-/tmp}
# EMACS_SOCKDIR=${EMACS_SOCKDIR:-/tmp/emacs0}
DAEMON_ARG=--daemon

if [ ! -z $SERVER_NAME ]; then
    DAEMON_ARG="${DAEMON_ARG}=$SERVER_NAME"
fi

# tail -f /dev/stdout

if [ "$(basename $1)" == emacs ]; then
    $@
else
    emacs $DAEMON_ARG --debug-init
fi

. /openssh_entry.sh
