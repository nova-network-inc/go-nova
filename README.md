# Nova Network

Nova Network is a open-source DAG programable smart contracts platform built for decentralised and enterprise-level applications, in one highly scalable ecosystem. Nova Network is home to digital money, decentralised infrastructure, and applications, ready and built to scale for global usage and adoption. It is compatible and interoperable with Ethereum and other EVM networks, and Solidity is natively compatible, making it easy and quick for Ethereum developers to build, deploy, or fork from existing open-source infrastructure built on other networks.

If you are using Microsoft Windows, we recommend you to use our Windows Node Manager. You can find more information on the following repository https://github.com/nova-network-inc/nova-network-node-manager.

## Installing and Running a Node

### Hardware Requirements

Minimum Requirements:

* CPU With 2+ Cores
* 8GB RAM
* 200GB of free storage to sync with Nova Network
* 8 MBit/sec download Internet service

Recommended Specs:

* Fast CPU With 4+ Cores
* 16GB+ RAM
* High Performance SSD with at least 1TB free space
* 25+ MBit/sec download Internet service

### Running the Scripts

We have made the process of building and installing Nova Network easy and simple with automated scripts. You will find a full list of available script commands below, but for installing your node all you need to do after cloning this repository is to execute the following scripts, in order:

First, run the ```install-node``` script to install all the dependencies.

```shell
bash install-node.sh
```

Then you open a detached screen so you can run your node and connect to the JS Console in the same machine.

```shell
screen
```

Now you start your node using the ```start-node``` script.

```shell
bash start-node.sh
```

All done! Your node should have started by now. You can use ```Ctrl + A + D``` to detach the screen and leave the node running in the background.

## Available Script Commands

All the commands listed below are bash scripts our team has compiled to facilitate the usage of Go Nova. Some of the scripts below will require ```CHMOD 777``` to work properly, and we always recommend running them using ```sudo```.

```shell

build-novanetwork.sh       - Builds Go Nova inside the build/bin folder.

deploy-novanetwork.sh      - Deploys Go Nova, making it globally available.

install-node.sh            - Installs all the node dependencies, builds and deploys Go Nova.

install-node-f.sh          - Install script without any sanity checks. USE WITH CAUTION!

start-console.sh           - Starts Nova Network JS Console. Requires the node to be running.

start-node.sh              - Starts a local node.

start-node-debug.sh        - Starts a local node in debug mode.

```

## More Information

For more information, you can visit our documents library available at https://docs.novanetwork.io or reach out directly to our support team.
