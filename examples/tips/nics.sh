#!/bin/bash
##############################################################
# File Name: nics.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################
ipb11="10.2.1.104"
macb11="60:45:bd:c0:90:f7"
ipb21="10.2.1.106"
macb21="7c:1e:52:08:d9:22"
function func_get_pci() {
  local PRIMARY=$1

  # Grab interface name for device bound to primary
  # $ ip -br link show master eth1
  # > enP30832p0s0     UP             f0:0d:3a:ec:b4:0a <... # truncated
  local SECONDARY="`ip -br link show master $PRIMARY | awk '{ print $1 }'`"

  # Get mac address for MANA interface (should match primary)
  local MANA_MAC="`ip -br link show master $PRIMARY | awk '{ print $3 }'`"

  # Get MANA device bus info to pass to DPDK
  # $ ethtool -i enP30832p0s0 | grep bus-info > bus-info: 7870:00:00.0
  local BUS_INFO="`ethtool -i $SECONDARY | grep bus-info | awk '{ print $2 }'`"
  echo "$BUS_INFO"
}
