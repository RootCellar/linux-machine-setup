#su root

modprobe zram

echo 8192M > /sys/block/zram0/disksize
mkswap --label zram0 /dev/zram0
swapon -p 100 /dev/zram0
