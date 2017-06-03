#!/bin/bash

rm -rf /var/run/rsyslogd.pid
service rsyslog start
cron
service ssh start
service php7.1-fpm start
nginx
