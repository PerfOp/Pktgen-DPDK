#!/bin/bash
##############################################################
# File Name: hosts.sh
# Author:
# mail:
# Created Time: Mon Sep 15 13:37:09 2025
##############################################################

# box 1 - nic 2
ipb11="10.2.1.104"
macb11="60:45:bd:c0:90:f7"
# box 2 - nic 2
ipb21="10.2.1.106"
macb21="7c:1e:52:08:d9:22"

srcip=$ipb11
dstip=$ipb21
srcmac=$macb11
dstmac=$macb21
srcport=1234
dstport=4321
