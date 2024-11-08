#!/bin/bash

sudo apt update

sudo apt install -y openssh-server rsync wget gzip git gcc g++ htop neofetch make \
build-essential whois dnsutils net-tools lm-sensors cpufrequtils tcpdump screen zip unzip telnet \
lshw python3 python-is-python3 sysstat stress smartmontools ufw

# extras: mpich zram-tools docker docker-compose

# This may need to be run on ubuntu server VMs because they don't come with all kernel modules like Zram: 
# sudo apt install linux-image-extra-virtual
