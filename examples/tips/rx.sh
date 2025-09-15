#!/bin/bash
##############################################################
# File Name: rx.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################

source ./nics.sh
if [ -z "$1" ]; then
  echo "Please input NIC name, such as eth1..."
  exit 1
fi

pci=$(func_get_pci $1);
echo $pci

# 1 rx end
dpdk-testpmd -l 0-3 -n 4 -a $pci \
	-- --port-topology=chained \
	--nb-cores=3 \
	--forward-mode=rxonly \
	--eth-peer=0,60:45:bd:c0:90:f7 \
	--stats-period 1
