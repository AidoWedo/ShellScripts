#!/bin/bash
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/^\(PubkeyAuthentication \).*/\1yes/' /etc/ssh/sshd_config
sed -i 's/^\(PasswordAuthentication \).*/\1yes/' /etc/ssh/sshd_config
sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 no/' /etc/ssh/sshd_config 
sed -i 's/GSSAPIAuthentication/#GSSAPIAuthentication/' /etc/ssh/sshd_config 
sed -i 's/GSSAPICleanupCredentials/#GSSAPICleanupCredentials/' /etc/ssh/sshd_config 
systemctl restart sshd
