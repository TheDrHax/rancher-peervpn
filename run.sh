#!/bin/bash

export VPN_IP="$(wget -O- http://rancher-metadata.rancher.internal/latest/self/host/agent_ip)/24"

$@
