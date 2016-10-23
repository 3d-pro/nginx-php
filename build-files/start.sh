#!/bin/bash

rm -rf /var/run/rsyslogd.pid
service rsyslog start
cron
service ssh start
service postfix start
service php7.0-fpm start
nginx
