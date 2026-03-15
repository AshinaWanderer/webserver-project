#!/bin/bash
# Keepalived notify script — called on every state transition.
# Install to: /etc/keepalived/notify.sh on BOTH VMs (chmod +x)
#
# Replace:
#   HCLOUD_TOKEN          — Hetzner API token (read+write)
#   FLOATING_IP_ID        — numeric ID of the Floating IP (from Hetzner console or `hcloud floating-ip list`)
#   THIS_SERVER_ID        — numeric ID of THIS server (different value on each VM)

HCLOUD_TOKEN="YOUR_HETZNER_API_TOKEN"
FLOATING_IP_ID="YOUR_FLOATING_IP_ID"
THIS_SERVER_ID="YOUR_SERVER_ID"

TYPE=$1   # INSTANCE / GROUP
NAME=$2   # instance name (VI_1)
STATE=$3  # MASTER / BACKUP / FAULT

log() { echo "$(date '+%Y-%m-%d %H:%M:%S') [keepalived] $*" | tee -a /var/log/keepalived-notify.log; }

case "$STATE" in
    MASTER)
        log "Became MASTER — assigning Floating IP ${FLOATING_IP_ID} to this server (${THIS_SERVER_ID})"

        # Tell Hetzner to route the Floating IP to this server
        curl -s -o /dev/null -w "%{http_code}" \
            -X POST "https://api.hetzner.cloud/v1/floating_ips/${FLOATING_IP_ID}/actions/assign" \
            -H "Authorization: Bearer ${HCLOUD_TOKEN}" \
            -H "Content-Type: application/json" \
            -d "{\"server\": ${THIS_SERVER_ID}}" | grep -q "^2" \
            && log "Floating IP assigned successfully" \
            || log "WARNING: Hetzner API call failed"
        ;;

    BACKUP)
        log "Became BACKUP — standing by"
        ;;

    FAULT)
        log "Entered FAULT state"
        ;;
esac
