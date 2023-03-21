#!/bin/bash


# This is more likely to be useful at home,
# but anyhow this reduces the voltage to each part of the CPU.
# This only works on intel as far as I know,
# and you need to figure out good values for these as making them too high will freeze up your system.
#
# The '-t' option sets the maximum operating temperature in Celsius, 
# handy if you prefer thermal throttling to happen sooner.
#
# Note: 'core' and 'cache' need to be the same.


sudo undervolt --core -120 --cache -120 --gpu -100 -t 85
sudo undervolt --read
