#!/bin/bash
##############################################################
# File Name: tx.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################

source ./hosts.sh
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
# * Capture: dpdk-dumpcap -c 100 -w capture.pcapng
# * Check:   tcpdump -nnn -e -r capture.pcapng
# https://doc.dpdk.org/guides/testpmd_app_ug/run_app.html#testpmd-command-line-options
# In command lines: show port stats all
$PMD_BIN $EAL_ARGS \
    -- -i --forward-mode=txonly \
    --port-topology=chained \
    --burst=$BURSTNUM \
    --txpkts=$PKTSIZE \
    --tx-ip=$srcip,$dstip \
    --tx-udp=$srcport,$dstport \
    --stats-period=1
#--nb-cores=3
