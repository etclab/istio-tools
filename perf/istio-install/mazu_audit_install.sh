#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# prevents injecting sidecar into the nfs-subdir-external-provisioner
kubectl patch deployment nfs-subdir-external-provisioner \
    -p '{"spec":{"template":{"metadata":{"annotations":{"sidecar.istio.io/inject":"false"}}}}}'

# Strategy 4: Auditable Update
# Audited updates from KC in addition to non-interactive challenge 
# response and token revocation check. Audited update verifies proof of membership.
DOCKER_TAG="st4-AudUpd" ./mazu_custom_install.sh

