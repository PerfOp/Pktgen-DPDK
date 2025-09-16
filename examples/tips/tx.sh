#!/bin/bash
##############################################################
# File Name: tx.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################

source ./utils.sh

if [ -z "$1" ]; then
  echo "Please input NIC name, such as eth1..."
  exit 1
fi

PCI=$(func_get_pci $1);

echo $PCI
EAL_ARGS="-l 0-3 -n 4 -a $PCI"

## 1 interaction mode for dpdk-pmd
#$pmd $EAL_ARGS -- -i --port-topology=chained

# 2 txonly for send
# Input "set 0 count 0 \n start 0 " to start send
# Capture: dpdk-dumpcap -c 100 -w /tmp/capture.pcapng
$pmd $EAL_ARGS \
    -- -i --forward-mode=txonly \
    --port-topology=chained --txpkts=64 --stats-period=1
#\
#--nb-cores=3 \
#--forward-mode=txonly \
#--eth-peer=0,7c:1e:52:08:d9:22 \
#--stats-period 1
