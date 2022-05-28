#!/bin/bash

# This script will start a Nova Network node in your machine. You will still have
# to set up your sync enode with your validator key to connect to the mainnet.
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 startNode.sh before launching, and then bash startNode.sh to start.

echo "======================================================="
echo "==              WELCOME TO NOVA NETWORK              =="
echo "==                 www.novanetwork.io                =="
echo "======================================================="
echo ""
echo "======================================================="
echo "== 1/2 == Configuring the network genesis file...    =="
echo "======================================================="
echo ""
geth --datadir .novanetwork init novanetwork
echo ""
echo "======================================================="
echo "== 2/2 == Starting your Nova Network node...         =="
echo "======================================================="
echo ""
geth --datadir .novanetwork --networkid "87" --rpc.allow-unprotected-txs --mine --miner.etherbase "0x000000000000000000000000000000000000dEaD" --nodiscover --graphql --maxpeers "1" --syncmode "snap" --ipcpath "novanetwork"
