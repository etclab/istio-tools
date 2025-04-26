kubectl -n twopods-istio port-forward svc/fortioclient 9076:9076 > /dev/null 2>&1 &
kubectl -n istio-prometheus port-forward svc/istio-prometheus 9090:9090 > /dev/null 2>&1 &
