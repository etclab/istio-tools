./build-system.sh 

./build-system.sh build-envoy

./build-system.sh build-istio

./build-system.sh setup-minikube

./build-system.sh install-istio

./build-system.sh book-info

./build-system.sh configure build-envoy build-istio setup-minikube install-istio book-info

./build-system.sh perf-setup-istio

./build-system.sh perf-setup-test