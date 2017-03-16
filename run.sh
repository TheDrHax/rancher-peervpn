#!/bin/bash

echo "169.254.169.250 rancher-metadata.rancher.internal" >> /etc/hosts

export VPN_IP="$(wget -O- http://rancher-metadata.rancher.internal/latest/self/host/agent_ip)/24"

$@
