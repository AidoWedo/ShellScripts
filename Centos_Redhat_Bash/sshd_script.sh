#!/bin/bash
# Modifies settings in an EC2 AWS Centos 7 image
# AWS seems to modify sshd settings back to PasswordAuthentication No
# This fixes that until I can work out why it is being reverted back
# Keeps PubKey Auth, Password Auth, Disables Root login (this should already be set) and Disables GSSAPI options that cause secondary auth issues
# Pam will be enabled and is left on
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/^\(PubkeyAuthentication \).*/\1yes/' /etc/ssh/sshd_config
sed -i 's/^\(PasswordAuthentication \).*/\1yes/' /etc/ssh/sshd_config
sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 no/' /etc/ssh/sshd_config 
sed -i 's/GSSAPIAuthentication/#GSSAPIAuthentication/' /etc/ssh/sshd_config 
sed -i 's/GSSAPICleanupCredentials/#GSSAPICleanupCredentials/' /etc/ssh/sshd_config 
systemctl restart sshd
