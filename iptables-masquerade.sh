#!/usr/bin/env /bin/bash

INTERFACE="eth0"
/sbin/iptables -t nat -A POSTROUTING -o ${INTERFACE} -j MASQUERADE
# /sbin/iptables -A FORWARD -i ${INTERFACE} -o ${INTERFACE} -m state --state RELATED,ESTABLISHED -j ACCEPT
# /sbin/iptables -A FORWARD -i ${INTERFACE} -o ${INTERFACE} -j ACCEPT
