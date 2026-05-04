#!/bin/bash
# =============================================================================
# check_connection.sh — Connectivity check, ping and latency measurement
# Author: Nerea Arce | github.com/arcenerea
# =============================================================================

TARGET=${1:-8.8.8.8}
PING_COUNT=5

echo "==============================="
echo "   Connection Check"
echo "   $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================="
echo "Target: ${TARGET}"
echo ""

# --- Ping test ---
echo "--- Ping Test (${PING_COUNT} packets) ---"
if ping -c "$PING_COUNT" "$TARGET" &>/dev/null; then
  PING_RESULT=$(ping -c "$PING_COUNT" "$TARGET" 2>/dev/null)
  PACKET_LOSS=$(echo "$PING_RESULT" | grep -oP '\d+(?=% packet loss)')
  AVG_LATENCY=$(echo "$PING_RESULT" | grep -oP '(?<=rtt min/avg/max/mdev = )[\d.]+/[\d.]+' | cut -d'/' -f2)

  echo "  Status      : ✔ Reachable"
  echo "  Packet loss : ${PACKET_LOSS}%"
  echo "  Avg latency : ${AVG_LATENCY} ms"
else
  echo "  Status      : ✘ Unreachable"
  echo "  Could not reach ${TARGET}."
fi

echo ""

# --- DNS resolution ---
echo "--- DNS Resolution ---"
if host "$TARGET" &>/dev/null; then
  RESOLVED=$(host "$TARGET" | head -1)
  echo "  ${RESOLVED}"
else
  echo "  Could not resolve ${TARGET}."
fi

echo ""

# --- HTTP connectivity (if target is a domain) ---
echo "--- HTTP Connectivity ---"
if curl -s --max-time 5 "http://${TARGET}" &>/dev/null; then
  echo "  HTTP : ✔ Reachable"
elif curl -s --max-time 5 "https://${TARGET}" &>/dev/null; then
  echo "  HTTPS: ✔ Reachable"
else
  echo "  HTTP/HTTPS: ✘ Not reachable or not a web server."
fi

echo ""
echo "==============================="
echo "Check complete."
echo "==============================="
