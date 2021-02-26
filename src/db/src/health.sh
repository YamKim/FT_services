#!/bin/sh
if [  "$(pgrep mysqld)" ];then

 exit(0)

 else

  exit(1)

fi