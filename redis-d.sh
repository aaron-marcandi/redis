#!/bin/sh
# chkconfig: 2345 95 20
# description: redis daemon script
# redis this script starts and stops the redis daemon
# config: /opt/redis/redis.conf
# binary: /opt/redis/redis-server

PATH=/opt/redis:/sbin:/bin:/usr/sbin:/usr/bin
NAME=redis

test -x $DAEMON || exit 0

set -e

case "$1" in
  start)
        echo -n "Starting Redis... "
        su - redis -c "/opt/redis/redis-server /opt/redis/redis.conf &"
        ;;
  stop)
        echo -n "Stopping Redis"
        killall /opt/redis/redis-server
        ;;
      *)
            N=/etc/init.d/$NAME
            echo "Usage: $N {start|stop}" >&2
            exit 1
            ;;
    esac

    exit 0
