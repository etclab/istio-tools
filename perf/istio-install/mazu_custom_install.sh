# set the appropriate dns domain
DNS_DOMAIN=${DNS_DOMAIN:-pc845.emulab.net}

./install_etcd.sh

DOCKER_TAG=atosh502
DOCKER_HUB="docker.io/${DOCKER_TAG}"

# use the default v1.24.0 release of istio
# but pull our custom docker hub images
DNS_DOMAIN=$DNS_DOMAIN VERSION=1.24.0 DOCKER_TAG=$DOCKER_TAG DOCKER_HUB=$DOCKER_HUB ./setup_istio.sh

# apply the role and bindings to query the k8s TokenReview API from pods
kubectl apply -f ./dev/token-review-role.yaml 
kubectl apply -f ./dev/token-review-binding.yaml 

# custom proxy
sed -i 's|^\s*image:.*|  image: "atosh502/proxyv2:atosh502"|' ../benchmark/values.yaml

# assuming replacing only the container images with the new ones work?
# we don't need to use RELEASE_URL to download the istio release tarball
# DNS_DOMAIN=pc833.emulab.net RELEASE_URL=https://github.com/etclab/istio/releases/download/v0.2.1/istio-v0.2.1.tar.gz ./setup_istio.sh
