#!/bin/bash

rm -rf /var/run/rsyslogd.pid
service rsyslog start
cron
service ssh start
service php8.2-fpm start
nginx
