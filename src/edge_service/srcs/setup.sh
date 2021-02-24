#!/bin/sh
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status
rc-update add nginx;
rc-update add sshd;
mkdir -p /etc/skel/

echo "welcome mf" > /etc/motd;

cat > /etc/skel/.logout << EOF
history -c
/bin/rm -f /opt/remote/.mysql_history
/bin/rm -f /opt/remote/.history
/bin/rm -f /opt/remote/.bash_history
EOF


echo  '%remote ALL=(ALL) ALL'  > /etc/sudoers.d/remote

cat > /etc/skel/.cshrc << EOF
set autologout = 30
set prompt = "$ "
set history = 0
set ignoreeof
EOF

cp /etc/skel/.cshrc /etc/skel/.profile

adduser -D --home /opt/remote --shell /bin/ash remote  remote

echo "remote:admin" | chpasswd


/etc/init.d/sshd start

nginx -g 'daemon off;'
