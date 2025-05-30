#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# ensure setup-tpm-all-nodes.sh is run first
# ./setup-tpm-all-nodes.sh -d wisc.cloudlab.us c220g1-030802 c220g1-030810 \
# c220g1-030815 c220g1-030808

# prevents injecting sidecar into the nfs-subdir-external-provisioner
kubectl patch deployment nfs-subdir-external-provisioner \
    -p '{"spec":{"template":{"metadata":{"annotations":{"sidecar.istio.io/inject":"false"}}}}}'

# creates the k8s-tpm-device
${SCRIPT_DIR}/dev/tpm/install-k8s-tpm-device.sh

# Strategy 5: Attested Update
# Attested and audited updates from KC in addition to non-interactive challenge 
# response and token revocation check. Audited update verifies proof of membership.
DOCKER_TAG="st5-AttUpd" ./mazu_custom_install.sh

# deploy the TPM secret to istio-system namespace
# deploy tpm config map and add tpm device to istiod
${SCRIPT_DIR}/dev/tpm/deploy-tpm-secret.sh
${SCRIPT_DIR}/dev/tpm/patch-istiod-tpm-device.sh
${SCRIPT_DIR}/dev/tpm/deploy-tpm-pubkey-configmap.sh
