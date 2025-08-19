#!/bin/bash

set -e

# MAZU Config and Build Script
# Author: Collin MacDonald (cmacdonald01@wm.edu)
# Date: January 27th, 2025

# Functions

mazu_echo() {
    local input_text="$*"
    echo -e "\e[1;30;44mMazu:\e[0m $input_text."
}

# Initialization

mazu_echo "Start of Script"

mazu_echo "Initializing variables from input flags"

# Initialize flags for operations
config_system=false
build_envoy_flag=false
build_istio_flag=false
setup_minikube_flag=false
install_istio_flag=false
run_hello_world_demo_flag=false
run_book_info_demo_flag=false
clean_flag=false

# eval related
perf_setup_istio_flag=false
perf_setup_test_flag=false

for cmd in "$@"; do
    case $cmd in
        configure) config_system=true ;;
        build-envoy) build_envoy_flag=true ;;
        build-istio) build_istio_flag=true ;;
        setup-minikube) setup_minikube_flag=true ;;
        install-istio) install_istio_flag=true ;;
        hello-world) run_hello_world_demo_flag=true ;;
        book-info) run_book_info_demo_flag=true ;;
        clean) clean_flag=true ;;
        perf-setup-istio) perf_setup_istio_flag=true ;;
        perf-setup-test) perf_setup_test_flag=true ;;
        *) 
            mazu_echo "Unknown command: $cmd"
            ;;
    esac
done

# Setup environment
mazu_echo "Setting up enviroment"

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export MAZU_WORKSPACE_DIR="$PWD/workspace"
export MAZU_ISTIO_DIR="$MAZU_WORKSPACE_DIR/istio"
export MAZU_PROXY_DIR="$MAZU_WORKSPACE_DIR/proxy"
export MAZU_ENVOY_DIR="$MAZU_PROXY_DIR/envoy"
export MAZU_ISTIO_TOOLS_DIR="$MAZU_WORKSPACE_DIR/istio-tools"

export MAZU_PROXY_OUT_DIR="$MAZU_PROXY_DIR/out/linux_amd64"
export MAZU_ISTIO_TMP_DIR="$MAZU_ISTIO_DIR/out/tmp"
export MAZU_USE_LOCAL_ENVOY=1

export GOCACHE="$HOME/.cache/go-build"
export DOCKER_USER="atosh502"
export HUB="docker.io/$DOCKER_USER"
export TAG="$DOCKER_USER"
export PULL_POLICY="Always"
export ISTIO="$MAZU_ISTIO_DIR"

# Setup workspace
mazu_echo "Setting up workspace"

if [[ ! -d $MAZU_WORKSPACE_DIR ]]; then
    mazu_echo "Creating workspace directory"
    mkdir -p $MAZU_WORKSPACE_DIR
fi

# Setup repos
mazu_echo "Setting up repos"

if [[ ! -d $MAZU_ISTIO_DIR ]]; then
    mazu_echo "Cloning Istio repo"
    git clone https://github.com/etclab/istio.git $MAZU_ISTIO_DIR
    git -C $MAZU_ISTIO_DIR fetch
    git -C $MAZU_ISTIO_DIR switch "dev"
else
    mazu_echo "Pulling Istio repo"
    git -C $MAZU_ISTIO_DIR pull
fi

if [[ ! -d $MAZU_PROXY_DIR ]]; then
    mazu_echo "Cloning Proxy repo"
    git clone https://github.com/etclab/proxy.git $MAZU_PROXY_DIR
    git -C $MAZU_PROXY_DIR fetch
    git -C $MAZU_PROXY_DIR switch "master"
else
    mazu_echo "Pulling Proxy repo"
    git -C $MAZU_PROXY_DIR pull
fi

if [[ ! -d $MAZU_ENVOY_DIR ]]; then
    mazu_echo "Cloning Envoy repo"
    git clone https://github.com/etclab/envoy.git $MAZU_ENVOY_DIR
    git -C $MAZU_ENVOY_DIR fetch
    git -C $MAZU_ENVOY_DIR switch "dev"
else
    mazu_echo "Pulling Envoy repo"
    git -C $MAZU_ENVOY_DIR pull
fi

if [[ ! -d $MAZU_ISTIO_TOOLS_DIR ]]; then
    mazu_echo "Cloning Istio Tools repo"

    git clone https://github.com/etclab/istio-tools.git $MAZU_ISTIO_TOOLS_DIR
    git -C $MAZU_ISTIO_TOOLS_DIR fetch
    git -C $MAZU_ISTIO_TOOLS_DIR switch "dev"
else
    mazu_echo "Pulling Istio Tools repo"
    git -C $MAZU_ISTIO_TOOLS_DIR pull
fi

if [[ "$build_envoy_flag" == "true" || "$config_system" == "true" ]]; then
    cd $MAZU_PROXY_DIR

    if [[ "$clean_flag" == "true" ]]; then
        mazu_echo "Bulding Envoy - 'make clean'"
        sudo BUILD_WITH_CONTAINER=1 make clean
    fi

    mazu_echo "Bulding Envoy - 'make build'"
    sudo BUILD_WITH_CONTAINER=1 make build

    mazu_echo "Bulding Envoy - 'make exportcache'"
    sudo BUILD_WITH_CONTAINER=1 make exportcache

    mkdir -p $MAZU_ISTIO_TMP_DIR
    cp -f "$MAZU_PROXY_OUT_DIR/envoy" "$MAZU_ISTIO_TMP_DIR/envoy"

    cd -
fi

if [[ "$build_istio_flag" == "true" || "$config_system" == "true" ]]; then

    cd $MAZU_ISTIO_DIR

    if [[ "$clean_flag" == "true" ]]; then
        mazu_echo "Bulding Istio - 'make clean'"
        BUILD_WITH_CONTAINER=1 make clean
    fi 

    mazu_echo "Bulding Istio - 'make build'"
    BUILD_WITH_CONTAINER=1 make build

    mazu_echo "Bulding Istio - 'make docker'"
    BUILD_WITH_CONTAINER=1 make docker

    mazu_echo "Bulding Istio - 'make docker.push'"
    BUILD_WITH_CONTAINER=1 make docker.push

    cd -
fi

if [[ "$setup_minikube_flag" == "true" || "$config_system" == "true" ]]; then
    mazu_echo "Setting up Minikube"
    
    minikube stop -p $USER && minikube delete -p $USER
    minikube start -p=$USER --memory=16384 --cpus=4 --kubernetes-version=v1.31.0
    # minikube start -p=$USER --memory=49152 --cpus=24 --kubernetes-version=v1.31.0
    minikube profile $USER
    minikube addons enable metrics-server -p $USER
fi

if [[ "$install_istio_flag" == "true" || "$config_system" == "true" ]]; then
    mazu_echo "Installing Istio"

    cd $MAZU_ISTIO_DIR

    # go run ./istioctl/cmd/istioctl install --set hub=$HUB --set tag=$TAG --context $USER --set "values.global.imagePullPolicy=Always" -y
    go run ./istioctl/cmd/istioctl install --set hub=$HUB --set tag=$TAG --set "values.global.imagePullPolicy=Always" -y

    mazu_echo "Installing token review role"
    kubectl apply -f ./dev/yaml/token-review-role.yaml 

    mazu_echo "Installing token review binding"
    kubectl apply -f ./dev/yaml/token-review-binding.yaml 

    mazu_echo "Installing etcd"
    ./dev/install-etcd.sh

    cd -
fi

mazu_echo "Configuration Complete"

if [[ "$run_hello_world_demo_flag" == "true" ]]; then
    mazu_echo "Starting Hello World Demo"

    cd $MAZU_ISTIO_DIR

    mazu_echo "Enabling injection"
    kubectl label namespace default istio-injection=enabled

    mazu_echo "Enabling Metrics Server"
    minikube addons enable metrics-server

    mazu_echo "Istalling Prometheus"
    kubectl apply -f ./samples/addons/prometheus.yaml

    mazu_echo "Installing Hello World Application"
    kubectl apply -f ./samples/helloworld/helloworld.yaml

    mazu_echo "Sleeping for 60 seconds"
    sleep 60

    mazu_echo "Enabling Port Forwarding - Prometheus"
    kubectl port-forward svc/prometheus 9090:9090 --namespace=istio-system &

    cd -

    mazu_echo "Ending Hello World Demo"
fi

if [[ "$run_book_info_demo_flag" == "true" ]]; then
    mazu_echo "Starting Book Info Demo"

    cd $MAZU_ISTIO_DIR

    mazu_echo "Enabling injection"
    kubectl label namespace default istio-injection=enabled

    mazu_echo "Enabling Metrics Server"
    minikube addons enable metrics-server

    mazu_echo "Istalling Prometheus"
    kubectl apply -f ./samples/addons/prometheus.yaml

    mazu_echo "Installing Kubernetes Gateway API"
    kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
        { kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/standard-install.yaml; }

    mazu_echo "Installing Book Info Application"
    kubectl apply -f ./samples/bookinfo/platform/kube/bookinfo.yaml

    mazu_echo "Installing Book Info Gateway"
    kubectl apply -f samples/bookinfo/gateway-api/bookinfo-gateway.yaml

    mazu_echo "Sleeping for 60 seconds"
    sleep 60

    mazu_echo "Installing Book Info Versions"
    kubectl apply -f samples/bookinfo/platform/kube/bookinfo-versions.yaml

    mazu_echo "Sleeping for 60 seconds"
    sleep 60

    mazu_echo "Enabling Port Forwarding - Prometheus"
    kubectl port-forward svc/prometheus 9090:9090 --namespace=istio-system &

    mazu_echo "Enabling Port Forwarding - Book Info Gateway"
    kubectl port-forward svc/bookinfo-gateway-istio 8080:80 &

    mazu_echo "Sending Sample Requests"
    for i in $(seq 1 100); do curl -s -o /dev/null "http://localhost:8080/productpage"; done

    cd -

    mazu_echo "Ending Demo"
fi

if [[ "$perf_setup_istio_flag" == "true" ]]; then
    mazu_echo "Setting up Istio for Performance Testing"

    cd $MAZU_ISTIO_TOOLS_DIR

    export TAG=""
    export DNS_DOMAIN="local"
    export VERSION=1.24.0

    cd perf/istio-install

    ./install_etcd.sh

    ./setup_istio.sh

    kubectl apply -f ./dev/token-review-role.yaml 
    kubectl apply -f ./dev/token-review-binding.yaml 

    cd - 

    mazu_echo "Setting up Istio for Performance Testing - Complete"
fi

if [[ "$perf_setup_test_flag" == "true" ]]; then
    mazu_echo "Setting up performance test"

    cd $MAZU_ISTIO_TOOLS_DIR

    # set the env vars
    export NAMESPACE=twopods-istio
    export INTERCEPTION_MODE=REDIRECT
    export ISTIO_INJECT=true
    export LOAD_GEN_TYPE=fortio
    export DNS_DOMAIN=local

    export FORTIO_CLIENT_URL=http://localhost:9076
    export PROMETHEUS_URL=http://localhost:9090

    cd perf/benchmark

    ./setup_test.sh

    cd -

    mazu_echo "Setting up performance test - Complete"
fi

mazu_echo "End of Script"
