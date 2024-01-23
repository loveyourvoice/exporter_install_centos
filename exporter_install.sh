#!/bin/sh

wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz

tar xvfz node_exporter-*.*-amd64.tar.gz

sudo mv node_exporter-1.7.0.linux-amd64 /usr/local/bin/node_exporter

sudo nano /etc/systemd/system/node_exporter.service <<EOL
[Unit]
Description=Node Exporter
After=network.target

[Service]
ExecStart=/bin/sh -c '/usr/local/bin/node_exporter/node_exporter'

[Install]
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload

sudo systemctl enable node_exporter

sudo systemctl start node_exporter

sudo iptables -A INPUT -p tcp --dport 9100 -j ACCEPT
