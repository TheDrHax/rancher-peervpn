#!/bin/bash

if [ ! "$VPN_IP" ]; then
    export VPN_IP="$(docker inspect rancher-agent | grep CATTLE_AGENT_IP | grep -o '[0-9\.]*')/24"
    echo "Detected host IP: $VPN_IP"
fi

cat >> /peervpn.conf <<EOF
networkname ${VPN_NAME}
psk ${VPN_KEY}
enabletunneling yes
enablerelay no
port 7000

interface vpn0
ifconfig4 ${VPN_IP}

enableprivdrop yes
user nobody
group nogroup

initpeers ${VPN_PEERS}
EOF

$@
