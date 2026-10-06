#!/bin/bash

STATE="/tmp/waybar-network-$USER"

iface=$(ip route show default 2>/dev/null | awk 'NR==1 {print $5}')

if [ -z "$iface" ] || [ ! -d "/sys/class/net/$iface" ]; then
    echo "NET:OFF"
    exit 0
fi

ipaddr=$(ip -4 addr show dev "$iface" 2>/dev/null \
    | awk '/inet / {print $2; exit}' \
    | cut -d/ -f1)

rx=$(cat "/sys/class/net/$iface/statistics/rx_bytes" 2>/dev/null || echo 0)
tx=$(cat "/sys/class/net/$iface/statistics/tx_bytes" 2>/dev/null || echo 0)
now=$(date +%s%N)

old_rx=0
old_tx=0
old_now="$now"

if [ -f "$STATE" ]; then
    read -r old_rx old_tx old_now < "$STATE"
fi

echo "$rx $tx $now" > "$STATE"

elapsed=$((now - old_now))

if [ "$elapsed" -gt 0 ]; then
    down=$(( (rx - old_rx) * 1000000000 / elapsed ))
    up=$(( (tx - old_tx) * 1000000000 / elapsed ))
else
    down=0
    up=0
fi

if [ "$down" -lt 0 ]; then down=0; fi
if [ "$up" -lt 0 ]; then up=0; fi

human() {
    awk -v b="$1" '
    BEGIN {
        if (b < 1000)
            printf "%.0fB/s", b
        else if (b < 1000000)
            printf "%.1fK/s", b / 1000
        else if (b < 1000000000)
            printf "%.1fM/s", b / 1000000
        else
            printf "%.1fG/s", b / 1000000000
    }'
}

down_fmt=$(human "$down")
up_fmt=$(human "$up")

if [ -n "$ipaddr" ]; then
    echo "IP:$ipaddr ↓$down_fmt ↑$up_fmt"
else
    echo "NO-IP"
fi