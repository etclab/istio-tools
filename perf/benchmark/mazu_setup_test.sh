# set the env vars
export NAMESPACE=twopods-istio
export INTERCEPTION_MODE=REDIRECT
export ISTIO_INJECT=true
export LOAD_GEN_TYPE=fortio
export DNS_DOMAIN=${DNS_DOMAIN:-pc803.emulab.net}

export FORTIO_CLIENT_URL=http://localhost:9076
export PROMETHEUS_URL=http://localhost:9090

# installs the fortio client/server in twopods-istio namespace
# uses our custom istio-proxy docker images
# TODO: envoy wasn't loading the custom cert validator extensions correctly?
./setup_test.sh