#!/bin/bash

# This script will start a Nova Network node in your machine. You will still have
# to set up your sync enode with your validator key to connect to the mainnet.
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 nodeStart.sh before launching, and then bash nodeStart.sh to start.

#Bootnode Parameters
publicNodeKey=8a4d05d13ccf1e5b8433633b96987d6293f22a92db2bb04c10fc2e490ba9edf33d3148eb2b355e57f13bd4dc443f00f9d95b7c790dbf92cbe5564eacb20b5789
publicNodeIp=87.106.153.207
publicNodePort=30303

# Welcome Message
echo "Welcome to Nova Network!"
echo ""
echo "Starting 1/2 - Configuring the network genesis block..."
novanetwork --datadir .dag init novanetwork
echo ""

# Starting Nova Network
echo "Starting 2/2 - Starting your Nova Network node..."
novanetwork --datadir .dag --networkid "87" --rpc.allow-unprotected-txs --nodiscover --maxpeers "1" --syncmode "snap" --ipcdisable --bootnodes "enode://${publicNodeKey}@${publicNodeIp}:${publicNodePort}?discport=0" --miner.etherbase "0x000000000000000000000000000000000000dEaD"
