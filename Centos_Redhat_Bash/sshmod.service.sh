[Unit]
Description=Modifiies SSHd_config on startup. Waits for system to be idle
After=network.target

[Service]
Type=idle
ExecStart=/var/tmp/sshmod.sh
TimeoutStartSec=0

[Install]
WantedBy=default.target