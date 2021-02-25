
cat > /etc/skel/.cshrc << EOF
set autologout = 30
set prompt = "$ "
set history = 0
set ignoreeof
EOF

cp /etc/skel/.cshrc /etc/skel/.profile

adduser -D --home /opt/remote --shell /bin/ash remote  remote

echo "remote:admin" | chpasswd

usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf