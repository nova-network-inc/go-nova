#!/bin/bash
# Build Nova Network using Golang.
echo "Building Nova Network..."
make novanetwork-full

# Rename 'geth' to 'novanetwork' inside the 'build/bin' folder.
sudo mv build/bin/geth build/bin/novanetwork
