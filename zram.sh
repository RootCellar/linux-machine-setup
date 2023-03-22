#!/bin/bash

#Run as root

modprobe zram

echo 8G > /sys/block/zram0/disksize
mkswap --label zram0 /dev/zram0
swapon -p 100 /dev/zram0

# Please only uncomment any of the below if you want it and know what you are doing!
# sysctl vm.swappiness=100 # Makes the kernel more likely to swap memory pages out to zram or disk in favor of file caches. Does not persist on shutown/reboot