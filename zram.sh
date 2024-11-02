#!/bin/env bash

# Written by RootCellar
# rootcellar on Discord, RootCellar on Github
#
# This script sets up a Zram block device for swap.
# Before doing so, it first resets the block device to be used.
# This script can therefore be run at any time to change the size or algorithm of a Zram swap.
#
# WARNING: Running this script while memory usage is high may cause problems as the Linux kernel will
# need to un-swap (and therefore decompress) pages that are currently stored in the Zram block device.
# Running this script *may* cause your machine to run out of memory in that case. Run at your own risk!

# The size of the Zram swap. I would recommend that you set this to a bit less than your system's
# available RAM.
# Note: you *can* set this higher than system RAM, and possibly see extended benefits at your own risk.
SIZE=8G

# The compression algorithm to use for the Zram swap.
# zstd - slowest, however it is the best at compressing data
# lz4 - fastest, but doesn't save as much space with compression
# lzo - balance between speed and effectiveness
#
# I recommend zstd, despite being slower, because it allows you to get the most out of your system
# RAM by saving more space than the other algorithms. Plus, by being better at compression,
# your system won't have to do the swapping and compression as often.
ALGORITHM=zstd

# The block device to use for zram swap
# This is here because it is possible to have multiple Zram block devices
# that are used for different purposes. Change this only if you know what you're doing.
DEVICE=zram0

echo Resetting Zram device...

# Reset Zram Device
swapoff /dev/$DEVICE || exit 1
echo 1 > /sys/block/$DEVICE/reset || exit 1

# Setup Zram block device
echo Initializing Zram device $DEVICE - $SIZE $ALGORITHM ...
modprobe zram || exit 1
echo $ALGORITHM > /sys/block/$DEVICE/comp_algorithm || exit 1
echo $SIZE > /sys/block/$DEVICE/disksize || exit 1

# Enable swap on the zram block device
mkswap --label $DEVICE /dev/$DEVICE || exit 1
echo Enabling $DEVICE as swap...
swapon -p 100 /dev/$DEVICE || exit 1
