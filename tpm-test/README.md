- Machine currently being used is: [`d430` in Emulab cluster](https://gitlab.flux.utah.edu/emulab/emulab-devel/-/wikis/Utah-Cluster/d430s) ([Intel Xeon Processor E5-2630v3](https://www.intel.com/content/www/us/en/products/sku/83356/intel-xeon-processor-e52630-v3-20m-cache-2-40-ghz/specifications.html))
- TPM 1.2 is available in this machine but it seems to be disabled
- `test-tpm.sh` 
    - checks `dmesg` and `/dev/tpm0` which succeeds
    - installs `tpm-tools` and `trousers`
    - checks `tcsd` is running
    - prints `tpm_version`
- `tpm_getpubek` fails as it requires owner password
```
apoudel@node-2:~$ sudo tpm_getpubek
Tspi_TPM_GetPubEndorsementKey failed: 0x00000008 - layer=tpm, code=0008 (8), The TPM target command has been disabled
Enter owner password: 
Tspi_TPM_GetPubEndorsementKey failed: 0x00000001 - layer=tpm, code=0001 (1), Authentication failed
apoudel@node-2:~$
```
- will try a different machine or ask cloudlab support
    