#!/bin/bash

# This script will install all the required packages for running a Nova Network
# node, as well as setting all the necessary environment variables.
# WARNING!!! This script will skip all sanity checks and install Go Nova even on
# machines that do not have the minimum requirements to run it. Use at your own risk!
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 installNode.sh before launching, and then bash install-node-f.sh to start.

# Install a backup instance of Go-Ethereum for dependencies.
echo "Installing 1/5 - Downloading dependencies..."
sudo apt-get upgrade
sudo apt-get update

# Install Golang to be able to build Go Nova.
echo "Installing 2/5 - Installing Golang..."
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt upgrade
sudo apt install golang-go
sudo apt install make

# Install Screen to be able to run the node on a detached screen.
echo "Installing 3/5 - Installing Screen..."
sudo apt install screen

# Download genesis block to start the network.
echo "Installing 4/5 - Downloading Genesis Block..."
wget https://novanetwork.io/download/271BD152B3C22467FA81F5F35B5EB9B6B9C2C827349E627B7B794DE8690707BA/novanetwork

# Build Go Nova using Golang.
echo "Installing 5/5 - Building Go Nova..."
make novanetwork-full
sudo chmod 777 build/bin/geth
sudo mv build/bin/geth build/bin/novanetwork
sudo chmod 777 build/bin/novanetwork
sudo mv sudo mv build/bin/novanetwork /usr/bin

# Cleanup the screen.
clear

# Display finished message.
echo "The installation script has finished. Thank you for installing Nova Network."
echo "You can start your node by running the start-node script."
