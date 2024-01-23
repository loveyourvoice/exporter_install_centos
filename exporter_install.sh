#!/bin/bash

# Шаг 1
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
sleep 2

# Шаг 2
tar xvfz node_exporter-*.*-amd64.tar.gz
sleep 2

# Шаг 3
sudo mv node_exporter-1.7.0.linux-amd64 /usr/local/bin/node_exporter
sleep 2

# Шаг 4
sudo nano /etc/systemd/system/node_exporter.service <<EOL
[Unit]
Description=Node Exporter
After=network.target

[Service]
ExecStart=/bin/sh -c '/usr/local/bin/node_exporter/node_exporter'

[Install]
WantedBy=multi-user.target
EOL
sleep 2

# Шаг 5
sudo systemctl daemon-reload
sleep 2

# Шаг 6
sudo systemctl enable node_exporter
sleep 2

# Шаг 7
sudo systemctl start node_exporter
sleep 2

# Шаг 8
sudo iptables -A INPUT -p tcp --dport 9100 -j ACCEPT
