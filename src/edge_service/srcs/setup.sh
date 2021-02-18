#!/bin/sh
rc-status
rc-update add nginx;
rc-update add sshd;