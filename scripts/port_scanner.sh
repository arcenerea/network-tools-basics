#!/bin/bash
# =============================================================================
# port_scanner.sh — TCP port scanning with configurable range
# Author: Nerea Arce | github.com/arcenerea
# =============================================================================

TARGET=${1:-127.0.0.1}
START_PORT=${2:-1}
END_PORT=${3:-1024}
TIMEOUT=1

echo "==============================="
echo "   Port Scanner"
echo "   $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================="
echo "Target     : ${TARGET}"
echo "Port range : ${START_PORT} - ${END_PORT}"
echo "==============================="
echo ""

OPEN_PORTS=()

for PORT in $(seq "$START_PORT" "$END_PORT"); do
  if timeout "$TIMEOUT" bash -c "echo >/dev/tcp/${TARGET}/${PORT}" 2>/dev/null; then
    SERVICE=$(getent services "$PORT/tcp" 2>/dev/null | awk '{print $1}')
    if [ -n "$SERVICE" ]; then
      echo "  ✔ Port ${PORT}/tcp — OPEN (${SERVICE})"
    else
      echo "  ✔ Port ${PORT}/tcp — OPEN"
    fi
    OPEN_PORTS+=("$PORT")
  fi
done

echo ""
echo "==============================="
if [ ${#OPEN_PORTS[@]} -eq 0 ]; then
  echo "No open ports found in range ${START_PORT}-${END_PORT}."
else
  echo "Open ports found: ${#OPEN_PORTS[@]}"
fi
echo "==============================="
