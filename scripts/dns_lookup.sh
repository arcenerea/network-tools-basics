#!/bin/bash
# =============================================================================
# dns_lookup.sh — DNS resolution, reverse lookup and diagnostics
# Author: Nerea Arce | github.com/arcenerea
# =============================================================================

TARGET=${1:-google.com}

echo "==============================="
echo "   DNS Lookup"
echo "   $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================="
echo "Target: ${TARGET}"
echo ""

# --- Forward DNS resolution ---
echo "--- Forward DNS Resolution ---"
if host "$TARGET" &>/dev/null; then
  host "$TARGET" | while read -r LINE; do
    echo "  ${LINE}"
  done
else
  echo "  Could not resolve ${TARGET}."
fi

echo ""

# --- Reverse DNS lookup ---
echo "--- Reverse DNS Lookup ---"
IP=$(dig +short "$TARGET" | head -1)
if [ -n "$IP" ]; then
  REVERSE=$(dig +short -x "$IP" 2>/dev/null)
  if [ -n "$REVERSE" ]; then
    echo "  IP: ${IP} → ${REVERSE}"
  else
    echo "  IP: ${IP} — no reverse record found."
  fi
else
  echo "  Could not resolve IP for ${TARGET}."
fi

echo ""

# --- Nameservers ---
echo "--- Nameservers ---"
dig +short NS "$TARGET" 2>/dev/null | while read -r NS; do
  echo "  NS: ${NS}"
done

echo ""

# --- MX Records ---
echo "--- MX Records ---"
dig +short MX "$TARGET" 2>/dev/null | while read -r MX; do
  echo "  MX: ${MX}"
done

echo ""

# --- TTL ---
echo "--- TTL ---"
TTL=$(dig +nocmd +noall +answer "$TARGET" 2>/dev/null | awk '{print $2}' | head -1)
if [ -n "$TTL" ]; then
  echo "  TTL: ${TTL} seconds"
else
  echo "  TTL not available."
fi

echo ""
echo "==============================="
echo "DNS lookup complete."
echo "==============================="
