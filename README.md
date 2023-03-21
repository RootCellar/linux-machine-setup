# Server Setup

This repository exists to collect a bunch of things together that are useful for servers (some things might be nice for a home computer or workstation as well).
Of course, what is deemed "important" is subject to the author's opinon.
If you know of anything that is either good for most servers **OR** is good in specific cases, please suggest it with a pull request!

So far, this repository only expects Ubuntu or Debian running on your server. Some things will work on others, some will not.

## Ubuntu (Main/Default assumption)

1. Run `./ubuntuinstalls.sh`

If you want Zram:

2. Reboot **IF** you had to install a package containing the zram kernel module
3. Copy `zram.service` to `/etc/systemd/system/`
4. Modify `zram.sh` to specify how much memory Zram can use, and place it in `/root/`
5. Run `systemctl enable zram.service && systemctl start zram.service`

If you want a ramdisk:

5. Modify the size in the ramdisk mount line in `ramdiskfstab` and copy the line into the file `/etc/fstab`
6. Run `mount -a`