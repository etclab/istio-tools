# go into every node and enable perf events
# run with: ./enable-perf-events.sh pc820 pc803 pc813 pc808

NODES=("$@")  # All command-line arguments

for NODE in "${NODES[@]}"; do
  echo "Running commands on $NODE..."
  ssh \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    apoudel@c220g1-${NODE}.wisc.cloudlab.us "sudo sysctl kernel.perf_event_paranoid=-1 && sudo sysctl kernel.kptr_restrict=0"
done