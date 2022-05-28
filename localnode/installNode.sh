#!/bin/bash

# This script will install all the required packages for running a Nova Network
# node, as well as setting all the necessary environment variables.
# This script requires elevated access privileged (CHMOD 777), please run:
# chmod 777 installNode.sh before launching, and then bash installNode.sh to start.

minRAM=8                 # Minimum RAM requirements in GB
minDisk=200              # Minimum Disk space requirements in GB
reqOS=Ubuntu             # Required OS
minOSver=18.04           # Minimum OS version

# Sanity check 1 - Do we have enough free disk space?
currDisk=`df -H --output=avail "$PWD" | tail -n 1 | tr -d " " | tr -d "G"`
if [[ ${currDisk} -lt ${minDisk} ]]
then
  echo "Min Disk space required = ${minDisk}G, Available ${currDisk}G. Aborting."
  exit
else
  echo "Sufficient Disk Space found."
fi

# Sanity check 2 - Do we have enough RAM memory?
currRAM=`free -g | grep -oP '\d+' | head -n 1`
if [[ ${currRAM} -lt ${minRAM} ]]
then
  echo "Min RAM space required = ${minRAM}G, Available ${currRAM}G. Aborting."
  exit
else
  echo "Sufficient RAM found."
fi

# Sanity check 3 - Do we have the correct OS?
currOS=`cat /etc/os-release | grep ^NAME= | tr -d "NAME=" | tr -d "\""`
if [[ ${currOS} != ${reqOS} ]]
then
  echo "Required OS is ${reqOS}, but current OS is ${currOS}. Aborting."
  exit
else
  echo "OS is correct."
fi

# Sanity check 4 - Does the OS version meet minimum requirements?
currOSver=`cat /etc/os-release | grep VERSION_ID | tr -d "VERSION_ID=" | tr -d "\""`
if (( $(echo "$currOSver < $minOSver" | bc -l) ))
then
  echo "Current OS version ${currOSver} does not meet minimum version ${minOSver} requirement. Aborting."
  exit
else
  echo "OS version meets requirements"
fi

# Sanity checks passed! Start installing packages.

echo "Your system passed the sanity checks. Installing required packages..."

sudo apt-get upgrade
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
sudo apt install screen
wget https://novanetwork.io/download/271BD152B3C22467FA81F5F35B5EB9B6B9C2C827349E627B7B794DE8690707BA/novanetwork
clear
echo "Nova Network has been successfully installed. You can now run the command"
echo "'screen' and execute the startNode.sh script to start your node."
