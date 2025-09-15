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

pci=$(func_get_pci $1);
echo $pci

# Auto gen pkts @ tx
$pktgen -l 0-3 -n 4 -a $pci -r 1 -- -P -m "[2-3].0" -f pkt.txt
