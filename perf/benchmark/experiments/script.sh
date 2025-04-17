# --- 

export NAMESPACE=twopods-istio
export INTERCEPTION_MODE=REDIRECT
export ISTIO_INJECT=true
export LOAD_GEN_TYPE=nighthawk
export DNS_DOMAIN=pc759.emulab.net

./get_proxy_perf.sh -p fortioclient-6988cbf5f9-24cxh -n twopods-istio -d 20 -f 99
./get_proxy_perf.sh -p fortioserver-656c4f4f9b-8xrts -n twopods-istio -d 20 -f 99