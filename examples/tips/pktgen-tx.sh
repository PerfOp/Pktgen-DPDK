#!/bin/bash
##############################################################
# File Name: tx.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################

source ./nics.sh
source ./hosts.sh

if [ -z "$1" ]; then
  echo "Please input NIC name, such as eth1..."
  exit 1
fi

pci=$(func_get_pci $1);
echo $pci

# # 1 quick verify
dpdk-testpmd -a $pci -- -i --port-topology=chained
# 2 tx end
# #dpdk-testpmd -l 0-3 -n 4 -a $pci \
# #	-- --port-topology=chained \
# #	--nb-cores=3 \
# #	--forward-mode=txonly \
# #	--eth-peer=0,7c:1e:52:08:d9:22 \
# #	--stats-period 1
