#!/bin/sh
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status
rc-update add nginx;
rc-update add sshd;



nginx -g 'daemon off;'
