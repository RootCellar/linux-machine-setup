#!/bin/bash

sudo apt update

sudo apt install -y rsync wget gzip git gcc g++ htop neofetch make build-essential net-tools lm-sensors cpufrequtils tcpdump docker docker-compose screen zip unzip telnet lshw python3 python-is-python3 sysstat zram-tools

# This may need to be run on ubuntu server VMs because they don't come with all kernel modules like Zram: sudo apt install linux-image-extra-virtual
