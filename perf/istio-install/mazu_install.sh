DNS_DOMAIN=pc833.emulab.net VERSION=1.24.0 ./setup_istio.sh

kubectl apply -f ./dev/token-review-role.yaml 
kubectl apply -f ./dev/token-review-binding.yaml 

# assuming replacing the containers of the 
# DNS_DOMAIN=pc833.emulab.net RELEASE_URL=https://github.com/etclab/istio/releases/download/v0.2.1/istio-v0.2.1.tar.gz ./setup_istio.sh
