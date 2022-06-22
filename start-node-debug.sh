#!/bin/bash

# This script will start a Nova Network node in your machine. You will still have
# to set up your sync enode with your validator key to connect to the mainnet.
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 startNode.sh before launching, and then bash startNode.sh to start.

# Welcome message.
echo "Welcome to Nova Network!"
echo "You are starting your node on DEBUG MODE. If you have chosen the DEBUG"
echo "mode by accident, please close this window and restart the script by"
echo "running the startNode script."
echo ""
echo "Starting 1/2 - Configuring the network genesis block... DEBUG MODE."
geth --datadir .novanetwork init novanetwork
echo ""

# Starting Nova Network
echo "Starting 2/2 - Starting your Nova Network node... DEBUG MODE."
geth --datadir .novanetwork --networkid "87" --rpc.allow-unprotected-txs --nodiscover --graphql --maxpeers "1" --syncmode "snap" --ipcpath "novanetwork"
