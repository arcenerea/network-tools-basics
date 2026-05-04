#!/bin/bash
# =============================================================================
# network_info.sh — Network interfaces, IP addresses, gateway and DNS info
# Author: Nerea Arce | github.com/arcenerea
# =============================================================================

echo "==============================="
echo "   Network Information Report"
echo "   $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================="
echo ""

# --- Interfaces ---
echo "--- Active Interfaces ---"
ip -br link show | while read -r LINE; do
  IFACE=$(echo "$LINE" | awk '{print $1}')
  STATE=$(echo "$LINE" | awk '{print $2}')
  echo "  Interface: ${IFACE} — ${STATE}"
done

echo ""

# --- IP Addresses ---
echo "--- IP Addresses ---"
ip -br addr show | while read -r LINE; do
  IFACE=$(echo "$LINE" | awk '{print $1}')
  IP=$(echo "$LINE" | awk '{print $3}')
  if [ -n "$IP" ]; then
    echo "  ${IFACE}: ${IP}"
  fi
done

echo ""

# --- Default Gateway ---
echo "--- Default Gateway ---"
GATEWAY=$(ip route | grep default | awk '{print $3}')
if [ -n "$GATEWAY" ]; then
  echo "  Gateway: ${GATEWAY}"
else
  echo "  No default gateway found."
fi

echo ""

# --- DNS Servers ---
echo "--- DNS Servers ---"
if [ -f /etc/resolv.conf ]; then
  grep "^nameserver" /etc/resolv.conf | while read -r LINE; do
    DNS=$(echo "$LINE" | awk '{print $2}')
    echo "  DNS: ${DNS}"
  done
else
  echo "  /etc/resolv.conf not found."
fi

echo ""

# --- Routing Table ---
echo "--- Routing Table ---"
ip route show | while read -r LINE; do
  echo "  ${LINE}"
done

echo ""
echo "==============================="
echo "Report complete."
echo "==============================="
