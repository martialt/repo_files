#!/usr/bin/env /bin/bash

INTERFACE="eth0"

# Enable IPv4 forwarding
bash -c "echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf"
sysctl -p /etc/sysctl.conf

# Enable masquerade
/sbin/iptables -t nat -A POSTROUTING -o ${INTERFACE} -j MASQUERADE
/sbin/iptables -A FORWARD -i ${INTERFACE} -o ${INTERFACE} -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i ${INTERFACE} -o ${INTERFACE} -j ACCEPT
