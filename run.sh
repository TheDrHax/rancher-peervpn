#!/bin/sh

if [ "$RANCHER_AGENT" ]; then
    export VPN_IP="$(docker inspect rancher-agent | grep CATTLE_AGENT_IP | grep -o '[0-9\.]*')"
    echo "Using variable CATTLE_AGENT_IP from $RANCHER_AGENT as VPN_IP ($VPN_IP)"
fi

exec /entrypoint.sh $@
