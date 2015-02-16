#!/bin/bash
rm -f /opt/redis-d.sh
rm -f /etc/init.d/redis
userdel -r redis
rm -rf /opt/redis
rm -rf /opt/redis-2.8.17

cp ./redis-d.sh /opt/redis-d.sh

mkdir /opt/redis
cd /opt/

wget http://download.redis.io/releases/redis-2.8.17.tar.gz
tar -xzf redis-2.8.17.tar.gz
cd redis-2.8.17
make

cp /opt/redis-2.8.17/redis.conf /opt/redis/redis.conf.default
cp /opt/redis-2.8.17/src/redis-benchmark /opt/redis/
cp /opt/redis-2.8.17/src/redis-cli /opt/redis/
cp /opt/redis-2.8.17/src/redis-server /opt/redis/
cp /opt/redis-2.8.17/src/redis-check-aof /opt/redis/
cp /opt/redis-2.8.17/src/redis-check-dump /opt/redis/
cp /opt/redis/redis.conf.default /opt/redis/redis.conf

useradd -M -r --home-dir /opt/redis redis
mv /opt/redis-d.sh /etc/init.d/redis
chmod +x /etc/init.d/redis
chown -R redis:redis /opt/redis
touch /var/log/redis.log
chown redis:redis /var/log/redis.log
chkconfig --add redis
chkconfig redis on
